@echo off
echo Cleaning Android Studio and Gradle caches...

rd /s /q "%USERPROFILE%\.gradle\caches" 2>nul
rd /s /q "%USERPROFILE%\.android\cache" 2>nul
rd /s /q "%USERPROFILE%\AppData\Local\Android\Sdk\system-images" 2>nul
rd /s /q "%USERPROFILE%\.android\avd" 2>nul

echo.
echo Cleanup complete! You can restart Android Studio now.
echo.
pause