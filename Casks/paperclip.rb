cask "paperclip" do
  version "0.3.1"
  sha256 "cbdf7f265fc4851c34dcab4361c9e26a5b8f267fef0eb846b3014795a21f0ef5"

  # The release workflow builds one universal dmg, so there is a single url for Apple Silicon and Intel.
  url "https://github.com/annuai/paperclip/releases/download/v#{version}/Paperclip_#{version}_universal.dmg"
  name "Paperclip"
  desc "Tiny desktop paperclip assistant that reminds you to drink water and stretch"
  homepage "https://github.com/annuai/paperclip"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Paperclip updates itself in place, so Homebrew should not fight it.
  auto_updates true
  depends_on macos: :big_sur

  app "Paperclip.app"

  uninstall quit: "app.paperclip.desktop"

  zap trash: [
    "~/Library/Application Support/app.paperclip.desktop",
    "~/Library/Caches/app.paperclip.desktop",
    "~/Library/LaunchAgents/Paperclip.plist",
    "~/Library/WebKit/app.paperclip.desktop",
  ]
end
