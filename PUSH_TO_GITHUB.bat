@echo off
echo 🚀 Pushing Spotify Downloader Cloud Server to GitHub...
echo.

echo 📁 Initializing git repository...
git init

echo 📝 Adding files...
git add .

echo 💾 Creating commit...
git commit -m "🎵 Spotify Downloader Cloud Audio Converter API - Ready for Railway deployment"

echo 🌐 Creating GitHub repo (you'll need to do this manually)...
echo.
echo ⚠️  MANUAL STEP REQUIRED:
echo 1. Go to https://github.com/new
echo 2. Create a new repository called "spotify-downloader-cloud-api"
echo 3. Don't initialize with README (we already have files)
echo 4. Copy the repository URL
echo.
echo 📤 After creating the repo, run these commands:
echo git remote add origin https://github.com/YOUR_USERNAME/spotify-downloader-cloud-api.git
echo git branch -M main
echo git push -u origin main
echo.
echo 🎯 Then deploy on Railway:
echo 1. Go to https://railway.app
echo 2. Click "Deploy from GitHub repo"
echo 3. Select your new repo
echo 4. Railway will auto-deploy!
echo.
pause