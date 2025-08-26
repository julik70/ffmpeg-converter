#!/bin/bash
echo "🚀 Pushing updates to GitHub..."
echo

# Add all changes
echo "📁 Adding all files..."
git add .

# Check if there are changes to commit
if ! git diff --staged --quiet; then
    # There are changes, ask for commit message
    read -p "Enter commit message (or press Enter for default): " message
    if [ -z "$message" ]; then
        message="Update audio converter API"
    fi
    
    echo "💾 Committing changes..."
    git commit -m "$message"
    
    echo "📤 Pushing to GitHub..."
    git push
    
    echo
    echo "✅ Successfully pushed to GitHub!"
    echo "🚀 Railway should auto-deploy your changes now."
    echo
else
    echo "⚠️ No changes to commit."
    echo
fi

echo "📋 Useful links:"
echo "- GitHub: https://github.com/yourusername/your-repo-name"
echo "- Railway: https://railway.app/dashboard"
echo