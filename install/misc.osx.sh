xcode-select --install

if [ -x "$(command -v xcodebuild)"]
then
  sudo xcodebuild -license accept
else
  echo "NOTE: xcodebuild is not installed, so not running the license accept. That probably means that this is only from the App Store version of XCode."
fi

sudo xcodebuild -license accept

defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1

brew install moreutils
brew install the_silver_searcher

# More installs
. ./install/iterm2.osx.sh
. ./install/alfred.osx.sh

