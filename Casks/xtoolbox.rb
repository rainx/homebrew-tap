cask "xtoolbox" do
  version "0.2.0"

  if Hardware::CPU.intel?
    sha256 "bcd5992cc20f51012dec3ac62fb175d02d9657eeb1df465e651254341bbcc459"
    url "https://github.com/rainx/xplayground/releases/download/v#{version}/xToolbox-#{version}-mac-x64.zip"
  else
    sha256 "f55f392ef140c32154f51e98e0bdef4e61066f6d69a1eab56d48a04fad1c7d21"
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
