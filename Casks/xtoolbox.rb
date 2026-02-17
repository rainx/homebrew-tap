cask "xtoolbox" do
  version "0.1.0"

  if Hardware::CPU.intel?
    sha256 "679c0de078e7fba3c5c08f2ef400585be9f7ac06a72e614d8b02da6bb337a362"
    url "https://github.com/rainx/xplayground/releases/download/v#{version}/xToolbox-#{version}-mac-x64.zip"
  else
    sha256 "11c95ddb3f4ea613db5b3c769731139ee46f43dd57f62d66ea8ced0a0b8e20c9"
    url "https://github.com/rainx/xplayground/releases/download/v#{version}/xToolbox-#{version}-mac-arm64.zip"
  end

  name "xToolbox"
  desc "Personal Mac toolbox - clone useful features from paid apps"
  homepage "https://github.com/rainx/xplayground"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "xToolbox.app"

  postflight do
    # Remove quarantine attribute to avoid "damaged app" warning
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/xToolbox.app"]
  end

  zap trash: [
    "~/Library/Application Support/xtoolbox",
    "~/Library/Preferences/com.rainx.xtoolbox.plist",
    "~/Library/Logs/xtoolbox",
  ]
end
