#!/bin/bash

# Check if arguments are provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 \"commit message\" \"branch name\""
  exit 1
fi

commit_message=$1
branch_name=$2

# Run rubocop to auto-correct
bin/rubocop -A

# Add all changes
git add .

# Commit the changes
git commit -m "$commit_message"

# Push to the specified branch
git push origin "$branch_name"
