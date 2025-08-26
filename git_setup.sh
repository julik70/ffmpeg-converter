#!/bin/bash
echo "🚀 Setting up Git repository for Vercel deployment..."
echo

# Check if git is configured
if ! git config user.name >/dev/null 2>&1; then
    echo "⚠️  Git user not configured. Setting up..."
    read -p "Enter your name: " username
    read -p "Enter your email: " email
    git config --global user.name "$username"
    git config --global user.email "$email"
    echo "✅ Git user configured!"
    echo
fi

# Initialize git repository
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: Audio converter API for Vercel"

echo
echo "✅ Git repository created successfully!"
echo
echo "📋 Next steps:"
echo "1. Create a new repository on GitHub"
echo "2. Copy the repository URL (e.g., https://github.com/yourusername/audio-converter-api.git)"
echo "3. Run these commands:"
echo
echo "   git remote add origin YOUR_GITHUB_REPO_URL"
echo "   git branch -M main"
echo "   git push -u origin main"
echo
echo "4. Then import the GitHub repo to Vercel"
echo