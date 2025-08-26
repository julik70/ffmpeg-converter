@echo off
echo 🚀 Pushing updates to GitHub...
echo.

REM Add all changes
echo 📁 Adding all files...
git add .

REM Check if there are changes to commit
git diff --staged --quiet
if errorlevel 1 (
    REM There are changes, ask for commit message
    set /p message="Enter commit message (or press Enter for default): "
    if "%message%"=="" set message="Update audio converter API"
    
    echo 💾 Committing changes...
    git commit -m "%message%"
    
    echo 📤 Pushing to GitHub...
    git push
    
    echo.
    echo ✅ Successfully pushed to GitHub!
    echo 🚀 Railway should auto-deploy your changes now.
    echo.
) else (
    echo ⚠️ No changes to commit.
    echo.
)

echo 📋 Useful links:
echo - GitHub: https://github.com/yourusername/your-repo-name
echo - Railway: https://railway.app/dashboard
echo.
pause