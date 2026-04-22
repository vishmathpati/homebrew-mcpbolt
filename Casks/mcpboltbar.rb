cask "mcpboltbar" do
  version "0.2.1"
  sha256 "c412899a6224d50c5d08e953beb31699637c4142fc78a2626e7c2e9386e3e8c7"

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
