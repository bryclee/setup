#!/bin/bash
last_commit_date=$(git log -1 --format=%cd --date=format:'%Y-%m-%d')
git commit -m $(date "+%Y-%m-%d")': '"$(git diff --cached --name-only | xargs)"
current_date=$(date +%Y-%m-%d)

if [ $(date -j -f "%Y-%m-%d" $last_commit_date +%s) -eq $(date -j -f "%Y-%m-%d" $current_date +%s) ]; then
    git reset HEAD~1
fi

git add .
git commit -m ${current_date}': '"$(git diff --cached --name-only | xargs)"
