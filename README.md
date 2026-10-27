# fejxc/homebrew-tap

[ProxyBridge](https://github.com/fejxc/ProxyBridge) 的自建 Homebrew 源——在 Mac 菜单栏一键把本地代理「带」到 Linux 服务器的菜单栏应用。

## 安装

```bash
brew install fejxc/tap/proxybridge
```

## 首次打开被拦截？

应用当前为 ad-hoc 签名（未公证），Homebrew 默认会给安装的应用打 quarantine 标记，首次打开可能被 Gatekeeper 拦截。被拦截时执行：

```bash
xattr -dr com.apple.quarantine /Applications/ProxyBridge.app
```

接入 Apple 公证后本节将删除。

## 更新

ProxyBridge 内置自更新器（校验官方 sha256 + 签名后原子替换），新版本发布后应用会自行提示并完成更新，**不要用 `brew upgrade`**——那会把已自更新的应用降回 tap 里记录的版本。

## 维护（仓库维护者）

新版本发布后，更新 cask 里的 `version` 与 `sha256` 两行：

```bash
./bump.sh 1.8.1 <新 DMG 的 sha256 或 .sha256 文件路径>
git commit -am "proxybridge 1.8.1" && git push
```

`livecheck` 已指向 GitHub Releases（`strategy :github_latest`），可随时用 `brew livecheck fejxc/tap/proxybridge` 核对最新版本是否已收录。
