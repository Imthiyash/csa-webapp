#!/bin/bash

# Run rubocop to auto-correct
bin/rubocop -A

# Add all changes
git add .

# Ask for commit message
echo "Enter commit message:"
read commit_message

# Commit the changes
git commit -m "$commit_message"

# Ask for branch name
echo "Enter branch name:"
read branch_name

# Push the changes
git push origin "$branch_name"
