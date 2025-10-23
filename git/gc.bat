@echo off
setlocal enabledelayedexpansion

REM Check if commit message is provided
if "%~1"=="" (
    echo Error: Please provide a commit message
    echo Usage: git.bat "your commit message"
    exit /b 1
)

echo ⬇️  Pulling latest changes...
git pull

echo ➕ Staging all changes...
git add .

echo 💾 Committing with message: %~1
git commit -m "%~1"

echo ⬆️  Pushing to remote...
git push

echo ✅ Done!