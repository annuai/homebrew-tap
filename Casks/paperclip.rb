cask "paperclip" do
  version "0.2.0"
  sha256 "bf2934803eb79e6986434896798be7829224e2d054205f896258cf147e9e810b"

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
  depends_on macos: ">= :big_sur"

  app "Paperclip.app"

  uninstall quit: "app.paperclip.desktop"

  zap trash: [
    "~/Library/Application Support/app.paperclip.desktop",
    "~/Library/Caches/app.paperclip.desktop",
    "~/Library/LaunchAgents/Paperclip.plist",
    "~/Library/WebKit/app.paperclip.desktop",
  ]
end
