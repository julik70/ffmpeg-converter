@echo off
echo 🚀 Deploy to Railway - Complete Setup
echo.

REM Check if git repository exists
if not exist ".git" (
    echo ⚠️ No git repository found. Running initial setup...
    call git_setup.bat
    echo.
)

REM Check if remote origin exists
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    echo ⚠️ No GitHub remote found.
    echo 📋 Please:
    echo 1. Create a repository on GitHub
    echo 2. Copy the repository URL
    echo 3. Run: git remote add origin YOUR_GITHUB_URL
    echo 4. Then run this script again
    echo.
    pause
    exit /b 1
)

REM Show current status
echo 📊 Current status:
git status --porcelain
echo.

REM Add all changes
echo 📁 Adding all files...
git add .

REM Check if there are changes to commit
git diff --staged --quiet
if errorlevel 1 (
    REM There are changes, ask for commit message
    set /p message="Enter commit message (or press Enter for default): "
    if "%message%"=="" set message="Deploy audio converter to Railway"
    
    echo 💾 Committing changes...
    git commit -m "%message%"
    
    echo 📤 Pushing to GitHub...
    git push
    
    echo.
    echo ✅ Successfully pushed to GitHub!
    echo.
    echo 🚂 Next steps for Railway:
    echo 1. Go to https://railway.app/dashboard
    echo 2. Click "New Project"
    echo 3. Select "Deploy from GitHub repo"
    echo 4. Choose your repository
    echo 5. Railway will auto-deploy!
    echo.
    echo 🌐 Your API will be available at:
    echo https://your-app-name.railway.app/api/convert
    echo.
) else (
    echo ⚠️ No changes to commit.
    echo 📤 Pushing anyway to trigger Railway deployment...
    git push
    echo.
)

echo 📋 Useful links:
echo - GitHub: https://github.com
echo - Railway Dashboard: https://railway.app/dashboard
echo - Railway Docs: https://docs.railway.app
echo.
pause