#!/bin/bash

function safelyLink {
  for file in "$@"
  do 
    target_file=~/$file

    if [ -e "$target_file" ]; then
      # If it has no size (invalid or empty)
      if [ ! -s "$target_file" ]; then
        rm $target_file
        # If it's a symlink
      elif [ -L "$target_file" ]; then
        echo "$target_file already linked, skipping"
        continue
      else
        echo "$target_file exists, creating backup $target_file.bak"
        mv $target_file $target_file.bak
      fi
    fi

    ln -sv $(pwd)/$file ~/
  done
}

# Link files here
safelyLink .vim .inputrc .gitconfig .bash_profile .bash_aliases .profile .bashrc \
    .tmux.conf .tmux.macosx .tmux.linux
