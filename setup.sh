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
    sudo apt-get install git -y
    sudo apt install checkinstall # For safe removing of packages later
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

# Install other items
# . ./install/startup.${OS}.sh


. ./install/vim.${OS}.sh

set +x
