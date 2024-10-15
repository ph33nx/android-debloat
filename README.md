Debloats Android by removing system apps from package.json. Tested on Asus ROG Phone II

1. First install a keyboard from play store, like Microsoft SwiftKey Keyboard, because this script removes the default google keyboard, so make sure there's a secondary keyboard installed by default.
2. Add or remov epackages in package.json if required.
3. Make sure adb is installed. On linux `sudo apt install android-tools-adb android-tools-fastboot`
4. Run debloat.sh `bash debloat.sh`