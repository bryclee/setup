#!/bin/bash

function safelyLink {
  for file in "$@"
  do 
    ./safelyLink.sh $file ~
  done
}

# Link files from here to home dir
safelyLink .vim .inputrc .gitconfig .bash_profile .bash_aliases .profile .bashrc \
    .tmux.conf .agignore .gitignore_global .slate.js .hyper.js .prettierrc.js

mkdir -p ~/.config
mkdir -p ~/.nvm

./safelyLink.sh nvim ~/.config
./safelyLink.sh .nvm/default-packages ~/.nvm
