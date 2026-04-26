cask "projecthub" do
  version "0.2.0"
  sha256 "e5671f8e379b41262c7d2581f2c975861594495405ed1801395c9476fa9acc80"

  url "https://github.com/vishmathpati/project-hub/releases/download/v#{version}/ProjectHub.zip"
  name "Project Hub"
  desc "Menu bar app for managing AI coding tool configs across projects"
  homepage "https://github.com/vishmathpati/project-hub"

  depends_on macos: ">= :sonoma"

  app "ProjectHub.app"

  # App is ad-hoc signed (not notarized). Strip quarantine on install.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ProjectHub.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.projecthub.ProjectHubBar.plist",
    "~/Library/Saved Application State/com.projecthub.ProjectHubBar.savedState",
    "~/Library/Application Support/com.projecthub.ProjectHubBar",
  ]

  caveats <<~EOS
    Project Hub lives in your menu bar. Click the stack icon to open it.

    The app is ad-hoc signed (not notarized by Apple). If macOS still blocks it:

      xattr -cr /Applications/ProjectHub.app

  EOS
end
