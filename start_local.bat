@echo off
echo 🚀 Starting Audio Converter API locally...
echo.

REM Check if node_modules exists
if not exist "node_modules" (
    echo 📦 Installing dependencies...
    npm install
    echo.
)

REM Check if FFmpeg is available
echo 🔍 Checking FFmpeg availability...
ffmpeg -version >nul 2>&1
if errorlevel 1 (
    echo ❌ FFmpeg not found in system PATH
    echo 📋 Please install FFmpeg:
    echo 1. Download from: https://ffmpeg.org/download.html
    echo 2. Add to system PATH
    echo 3. Or the server will try to use the npm package
    echo.
) else (
    echo ✅ FFmpeg found in system
)

echo 🌐 Starting local development server...
echo 📍 Server will be available at: http://localhost:3000
echo.
echo 🧪 Test endpoints:
echo - Health check: http://localhost:3000/api/health
echo - Convert API: http://localhost:3000/api/convert (POST)
echo.
echo 🛑 Press Ctrl+C to stop the server
echo.

REM Start the development server
npm run dev