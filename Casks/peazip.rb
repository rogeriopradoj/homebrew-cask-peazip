cask "peazip" do
  version "9.2.0"
  sha256 "4116f990e017ed2aaf4283338ee957feb5a7df2aabcf49a5ee16ec863429817e"

  # github.com/rogeriopradoj/homebrew-cask-peazip/ was verified as official when first introduced to the cask
  url "https://github.com/peazip/PeaZip/releases/download/9.2.0/peazip-9.2.0.DARWIN.aarch64.dmg"
  name "PeaZip"
  homepage "https://peazip.github.io/"

  app "peazip.app"

  caveats <<~EOS
    1. You may need to run the following command to use PeaZip.app (*):

      xattr -dr com.apple.quarantine /Applications/peazip.app

    2. As PeaZip's compiled binaries are unsigned, they will ask for permission to access certain paths on your machine the first time. On most macOS system versions it is sufficient to respond "OK" once to the system's permission request.      

    (*) If the system shows the error message "peazip.app is damaged and can’t be opened. You should move it to the Trash" or "peazip.app cannot be opened because the developer cannot be verified" the first time you run PeaZip, it simply means Safari has applied the "quarantine" attribute to the downloaded app package. Those warning messages are issue because the application's binaries are not signed (M1 version is simply ad-hoc signed, Intel version is not signed): to fix the error open the Terminal and run the aforementioned xattr command.
    
  EOS

end
