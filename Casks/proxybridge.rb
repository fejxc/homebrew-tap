cask "proxybridge" do
  version "1.8.1"
  sha256 "a3586e7d1ca95ed17130d1ceca52e6eb56d769b573b9f6055300e4d0f81280be"

  url "https://github.com/fejxc/ProxyBridge/releases/download/v#{version}/ProxyBridge-#{version}-universal.dmg"
  name "ProxyBridge"
  desc "Menu bar app that shares a local proxy with Linux servers over SSH"
  homepage "https://github.com/fejxc/ProxyBridge"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "ProxyBridge.app"

  caveats <<~EOS
    应用为 ad-hoc 签名（未公证），Homebrew 默认会给安装的应用打 quarantine 标记，首次打开可能被 Gatekeeper 拦截。
    被拦截时可在终端执行：xattr -dr com.apple.quarantine /Applications/ProxyBridge.app
    应用内置自更新器（auto_updates），新版本请在应用内更新，无需 brew upgrade。
  EOS
end
