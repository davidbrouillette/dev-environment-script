#!/usr/bin/env bash

echo "Installing Dev Setup"

# Install homebrew
if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install Cask for hombrew
if test ! brew info cask &>/dev/null; then
  echo "Installing cask"
  brew tap caskroom/cask
fi

echo "Installing VSCode"
# Install VSCode
brew cask install --appdir="~/Applications" visual-studio-code

echo "Adding 'code' to path"
# Adding 'code' to path
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

echo "Adding VSCode 'settings-sync' extension"
# Install 'Settings Sync' VSCode Extension
/usr/bin/code install-extension Shan.code-settings-sync

echo "Configuring OSX"
# Show all Files, including dot files
/usr/bin/defaults write com.apple.finder AppleShowAllFiles YES

# Show filename extensions by default
/usr/bin/defaults write NSGlobalDomain AppleShowAllExtensions -boolean true

# Reset Finder
/usr/bin/killall Finder

echo "Cleaning up"
brew cleanup
brew cask cleanup

echo "Dev Setup Complete"