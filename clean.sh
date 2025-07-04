#!/bin/bash
echo "Cleaning Android Studio and Gradle caches on macOS..."

# Clean Gradle cache
rm -rf ~/.gradle/caches
echo "Cleaned Gradle caches"

# Clean Android Studio caches
rm -rf ~/Library/Caches/AndroidStudio*
rm -rf ~/Library/Caches/Google/AndroidStudio*
echo "Cleaned Android Studio caches"

# Clean Android SDK system images
rm -rf ~/Library/Android/sdk/system-images
echo "Cleaned Android SDK system images"

# Clean AVD files (emulators)
rm -rf ~/.android/avd
echo "Cleaned AVD files"

# Clean Android build tools cache
rm -rf ~/Library/Android/sdk/build-tools/.temp
echo "Cleaned build tools cache"

echo ""
echo "Cleanup complete! You can restart Android Studio now."
echo ""