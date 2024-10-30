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
    sudo apt-get install -y software-properties-common checkinstall man-db curl
    sudo add-apt-repository -y ppa:git-core/ppa
    sudo apt-get update
    sudo apt-get install -y git
    ;;
  osx)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    brew install git
    ;;
esac

git clone https://www.github.com/bryclee/setup
cd setup

. ./setup.sh

set +x
