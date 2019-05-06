#!/bin/bash
set -e

day_modifier=$1

# last_commit_date=$(git log -1 --format=%cd --date=format:'%Y-%m-%d')
last_commit_date=$(git log -1 --format=%s | sed 's/^\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\).*$/\1/g')
target_date=$(date ${day_modifier:+-v}$day_modifier +%Y-%m-%d)

if [ $(date -j -f "%Y-%m-%d" $last_commit_date +%s) -eq $(date -j -f "%Y-%m-%d" $target_date +%s) ]; then
    git reset HEAD~1
fi

git add .

echo ${target_date}':' > .git/COMMIT_EDITMSG
git diff --cached --name-only >> .git/COMMIT_EDITMSG

git commit -F .git/COMMIT_EDITMSG

git push origin HEAD -f
