#!/bin/bash

function safelyLink {
  for file in "$@"
  do 
    ./safelyLink.sh $file ~
  done
}

# Link files here
safelyLink .vim .inputrc .gitconfig .bash_profile .bash_aliases .profile .bashrc \
    .tmux.conf .tmux.macosx .tmux.linux .gitignore_global

mkdir -p ~/.config

./safelyLink.sh nvim ~/.config
./safelyLink.sh .nvm/default-packages ~/.nvm
