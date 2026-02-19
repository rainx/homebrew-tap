cask "xtoolbox" do
  version "0.3.0"

  if Hardware::CPU.intel?
    sha256 "0ac61501801861a6984464b1d94639bbcdd15c863beb42e775b77db26f2f3764"
    url "https://github.com/rainx/xplayground/releases/download/v#{version}/xToolbox-#{version}-mac-x64.zip"
  else
    sha256 "20802f322752efb2887a71a83e107dc678684fc656f4fb199a3ae584fa82d12d"
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
