#!/bin/bash
# 用法：./bump.sh <版本号> <sha256 十六进制串 或 .sha256 文件路径>
# 更新 Casks/proxybridge.rb 中的 version 与 sha256 两行（build_dmg.sh 产物旁即有 .sha256 文件）。
set -euo pipefail
cd "$(dirname "$0")"

VERSION="${1:?用法：./bump.sh <版本号> <sha256 或 .sha256 文件路径>}"
INPUT="${2:?缺少 sha256 参数}"
CASK="Casks/proxybridge.rb"

[[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || { echo "版本必须为 x.y.z" >&2; exit 1; }

if [[ -f "$INPUT" ]]; then
  SHA=$(awk '{print $1}' "$INPUT")
else
  SHA="$INPUT"
fi
[[ "$SHA" =~ ^[0-9a-f]{64}$ ]] || { echo "sha256 格式不对：$SHA" >&2; exit 1; }

sed -i '' -E "s/^  version \".*\"/  version \"${VERSION}\"/" "$CASK"
sed -i '' -E "s/^  sha256 \".*\"/  sha256 \"${SHA}\"/" "$CASK"

grep -E '^  (version|sha256)' "$CASK"
echo "已更新 ${CASK} 到 ${VERSION}，请提交并推送。"
