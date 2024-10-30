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
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g ApplePressAndHoldEnabled -bool false

# I don't really use ag (silver searcher) anymore
# I am not sure if I need moreutils or bash-completion, can add those back if needed
# brew install moreutils the_silver_searcher bash-completion ripgrep
brew install ripgrep

# More installs
# . ./install/iterm2.osx.sh
. ./install/fzf.osx.sh
. ./install/alfred.osx.sh
. ./install/kitty.osx.sh
# Use hammerspoon instead of slate
# . ./install/slate.osx.sh
. ./install/nvim.osx.sh

brew install --cask scroll-reverser
