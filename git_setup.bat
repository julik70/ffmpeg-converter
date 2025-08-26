@echo off
echo 🚀 Setting up Git repository for Vercel deployment...
echo.

REM Check if git is configured
git config user.name >nul 2>&1
if errorlevel 1 (
    echo ⚠️  Git user not configured. Setting up...
    set /p username="Enter your name: "
    set /p email="Enter your email: "
    git config --global user.name "%username%"
    git config --global user.email "%email%"
    echo ✅ Git user configured!
    echo.
)

REM Initialize git repository
git init

REM Add all files
git add .

REM Create initial commit
git commit -m "Initial commit: Audio converter API for Vercel"

echo.
echo ✅ Git repository created successfully!
echo.
echo 📋 Next steps:
echo 1. Create a new repository on GitHub
echo 2. Copy the repository URL (e.g., https://github.com/yourusername/audio-converter-api.git)
echo 3. Run these commands:
echo.
echo    git remote add origin YOUR_GITHUB_REPO_URL
echo    git branch -M main
echo    git push -u origin main
echo.
echo 4. Then import the GitHub repo to Vercel
echo.
pause