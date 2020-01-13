#!/bin/bash
set -e

note_name=$1
target_date=$(date +%Y-%m-%d)

target_date=$(date ${day_modifier:+-v}$day_modifier +%Y-%m-%d)
daily_file="_dailies/${target_date}.md"
note_filename="${target_date}${note_name:+_}${note_name}.md"
file="_dailies/${note_filename}"

if [ ! -e "$daily_file" ]
then
    cat _dailies/TEMPLATE.md >> $daily_file
fi

if [ ! -e "$file" -a -n "$note_name" ]
then
    echo "# ${note_name}" >> $file
    echo "- [${note_name}](./$note_filename)" >> $daily_file
fi

nvim $file
