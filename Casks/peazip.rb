cask "peazip" do
  version "9.5.0"
  name "PeaZip"
  homepage "https://peazip.github.io/"

  arch arm: "aarch64", intel: "x86_64"
  sha256 arm:   "3855825eaeb983c1544aa0bc9dfb4efcc3111e52ff365ea2c4336415b730b45d",
         intel: "db7c351efa3f464898c79a90986e043b980ad35412ae22f8f2ec34678f11a1f4"

  # github.com/rogeriopradoj/homebrew-cask-peazip/ was verified as official when first introduced to the cask
  url "https://github.com/peazip/PeaZip/releases/download/#{version}/peazip-#{version}.DARWIN.#{arch}.dmg"

  app "peazip.app"

  caveats <<~EOS
    1. You may need to run the following command to use PeaZip.app (*):

      xattr -dr com.apple.quarantine /Applications/peazip.app

    2. As PeaZip's compiled binaries are unsigned, they will ask for permission to access certain paths on your machine the first time. On most macOS system versions it is sufficient to respond "OK" once to the system's permission request.      

    (*) If the system shows the error message "peazip.app is damaged and can’t be opened. You should move it to the Trash" or "peazip.app cannot be opened because the developer cannot be verified" the first time you run PeaZip, it simply means Safari has applied the "quarantine" attribute to the downloaded app package. Those warning messages are issue because the application's binaries are not signed (M1 version is simply ad-hoc signed, Intel version is not signed): to fix the error open the Terminal and run the aforementioned xattr command.
    
  EOS

end
