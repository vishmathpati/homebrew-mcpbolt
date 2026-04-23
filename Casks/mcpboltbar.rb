cask "mcpboltbar" do
  version "0.5.5"
  sha256 "fe95ee310b2742566f3f41f9452c76d495ff4a0a12ee8e1bacd4ad79e3313211"

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
  depends_on macos: ">= :sonoma"

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
