#!/bin/bash
set -x

cd ~

case $(uname -s) in
  Linux*)
    OS=linux;;
  Darwin*)
    OS=osx;;
  *)
    echo "Unrecognized OS $(uname -s)"
    exit 1
esac

echo "OS: $OS"
pwd

# Install git - prerequisites for downloading the setup scripts
case "$OS" in
  linux)
    sudo apt-get update -y
    sudo apt-get install -y git checkinstall man-db curl
    ;;
  osx)
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install git
    ;;
esac

git clone https://www.github.com/bryclee/setup
cd setup

# Run the installation for the submodules
git submodule init
git submodule update

# Run the link script to link vim and other rc files
. ./link.sh

# Run the install scripts for different items.
# Note that these are run from the setup dir.
. ./install/misc.${OS}.sh
. ./install/node.${OS}.sh
. ./install/vim.${OS}.sh

# Install vim plugins with vim-plug and then quit
vi +PlugInstall +qall

set +x
