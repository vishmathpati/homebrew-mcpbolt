cask "mcpboltbar" do
  version "0.1.4"
  sha256 "8aeda94502fc7f9eb796f415d4b6d98893ff4d5201400b26cccba72870540677"

  url "https://github.com/vishmathpati/mcpbolt/releases/download/mac-v#{version}/MCPBoltBar.zip"
  name "MCPBoltBar"
  desc "Menu bar app for managing MCP servers across AI coding tools"
  homepage "https://github.com/vishmathpati/mcpbolt"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^mac-v(\d+(?:\.\d+)+)$/i)
  end

  auto_updates false
  depends_on macos: ">= :monterey"

  app "MCPBoltBar.app"

  # App is ad-hoc signed (not notarized). Strip the quarantine flag on install
  # so Gatekeeper doesn't block first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/MCPBoltBar.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.mcpbolt.MCPBoltBar.plist",
    "~/Library/Saved Application State/com.mcpbolt.MCPBoltBar.savedState",
  ]

  caveats <<~EOS
    MCPBoltBar lives in your menu bar (⚡ icon). Click it to see your MCP servers.

    The app is ad-hoc signed (not notarized by Apple). This installer strips
    the quarantine flag automatically. If macOS still complains:

      xattr -cr /Applications/MCPBoltBar.app

  EOS
end
