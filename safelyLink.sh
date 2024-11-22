#!/bin/bash

function _f() {
  file=$1
  target_dir=$2

  if [ -z "$file" -o -z "$target_dir" ]; then
    echo "No arguments provided, cancelling safelyLink"
    return
  fi

  target_file_name=$(basename $file)
  target_file=$target_dir/$target_file_name

  if [ -e "$target_file" ]; then
    # If it has no size (invalid or empty)
    if [ ! -s "$target_file" ]; then
      rm $target_file
      # If it's a symlink
    elif [ -L "$target_file" ]; then
      echo "$target_file already linked, skipping"
      exit
    else
      echo "$target_file exists, creating backup $target_file.bak"
      mv $target_file $target_file.bak
    fi
  fi

  if [ -L "$target_dir" ]; then
    echo "$target_dir directory already linked, skipping linking $file"
    exit
  fi

  ln -sv $(pwd)/$file $target_dir
}

_f "$@"
