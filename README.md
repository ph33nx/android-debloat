Debloats Android using adb by removing system apps from apps.txt. Tested on Asus ROG Phone II

1. First install a keyboard from play store, like Microsoft SwiftKey Keyboard, because this script removes the default google keyboard, so make sure there's a secondary keyboard installed by default.
2. Add or remove packages in apps.txt if required.
3. Make sure adb is installed. On linux `sudo apt install android-tools-adb android-tools-fastboot`
4. Run `bash debloat.sh`
