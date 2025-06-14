#!/bin/bash

function safelyLink {
  for file in "$@"
  do
    ./safelyLink.sh $file ~
  done
}

# Link files from here to home dir
safelyLink .inputrc .gitconfig .bash_profile .bash_aliases .profile .bashrc .zshrc \
    .tmux.conf .agignore .gitignore_global .slate.js .hyper.js .prettierrc.js .eslintrc.js \
    .hammerspoon .ideavimrc .wezterm.lua

mkdir -p ~/.config

./safelyLink.sh vim ~/.vim
./safelyLink.sh nvim ~/.config
./safelyLink.sh kitty ~/.config
./safelyLink.sh lazygit ~/.config
./safelyLink.sh astronvim ~/.config
./safelyLink.sh kickstart ~/.config
./safelyLink.sh doom ~/.config
./safelyLink.sh default-npm-packages ~/.default-npm-packages

