#!/bin/bash

# Check if commit message is provided
if [ -z "$1" ]; then
    echo "Error: Please provide a commit message"
    echo "Usage: ./gitcanc.sh \"your commit message\""
    exit 1
fi

echo "🔄 Canceling last commit..."
git reset --soft HEAD~1

echo "⬇️  Pulling latest changes..."
git pull

echo "➕ Staging all changes..."
git add .

echo "💾 Committing with message: $1"
git commit -m "$1"

echo "⬆️  Pushing to remote..."
git push

echo "✅ Done!"