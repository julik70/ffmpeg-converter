@echo off
setlocal enabledelayedexpansion
echo 🔍 Finding your computer's IP address for Android phone connection...
echo.

REM Get IP address
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4 Address"') do (
    set "ip=%%a"
    set "ip=!ip: =!"
    if not "!ip!"=="" (
        echo 📍 Found IP address: !ip!
        echo.
        echo 📋 Update your Android app configuration:
        echo.
        echo In app/src/main/python/converter_config.py, change:
        echo LOCAL_SERVER = "http://!ip!:3000/api/convert"
        echo.
        echo 🌐 Your server will be accessible at:
        echo http://!ip!:3000
        echo.
        goto :found
    )
)

:found
echo 🔧 Make sure:
echo 1. Your phone and computer are on the same WiFi network
echo 2. Windows Firewall allows connections on port 3000
echo 3. Start the server with: start_local.bat
echo.
pause