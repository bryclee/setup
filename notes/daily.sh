#!/bin/bash
set -e

note_name=$1
target_date=$(date +%Y-%m-%d)

if [ -z "$note_name" ]
then
    vi todo.md
    exit
fi

target_date=$(date ${day_modifier:+-v}$day_modifier +%Y-%m-%d)
note_filename="${target_date}${note_name:+_}${note_name}.md"
file="_daily/${note_filename}"

if [ ! -e "$file" ]
then
    echo "# ${note_name:-Notes}" >> $file
    echo "" >> $file
    echo "" >> $file
fi

$EDITOR +3 $file
