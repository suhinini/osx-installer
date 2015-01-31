#!/bin/bash

# USAGE: curl -L http://suhinini.github.io/osx-installer/data/osx-installer.sh | sh

# installing brew

if ! hash brew 2>/dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
else
    echo "brew already installed"
fi

# installing things from brew

if brew list -1 | grep -q "^brew-cask\$"; then
    echo "brew/cask already installed"
else
    brew install caskroom/cask/brew-cask
fi

if brew list -1 | grep -q "^wget\$"; then
    echo "brew/wget already installed"
else
    brew install wget
fi

# cask goodies

if brew cask list -1 | grep -q "^google-chrome\$"; then
    echo "cask/google-chrome already installed"
else
    brew cask install google-chrome
fi

if brew cask list -1 | grep -q "^sublime-text$"; then
    echo "cask/sublime-text already installed"
else
    brew cask install sublime-text
fi

if brew cask list -1 | grep -q "^viber$"; then
    echo "cask/viber already installed"
else
    brew cask install viber
fi 

if brew cask list -1 | grep -q "^skype$"; then
    echo "cask/skype already installed"
else
    brew cask install skype
fi 

if brew cask list -1 | grep -q "^evernote$"; then
    echo "cask/evernote already installed"
else
    brew cask install evernote
fi 

if brew cask list -1 | grep -q "^iterm2$"; then
    echo "cask/iterm2 already installed"
else
    brew cask install iterm2
fi 

if brew cask list -1 | grep -q "^vlc$"; then
    echo "cask/vlc already installed"
else
    brew cask install vlc
fi 

if brew cask list -1 | grep -q "^dropbox$"; then
    echo "cask/dropbox already installed"
else
    brew cask install dropbox
fi 

if brew cask list -1 | grep -q "^clipmenu$"; then
    echo "cask/clipmenu already installed"
else
    brew cask install clipmenu
fi 

if brew cask list -1 | grep -q "^slack$"; then
    echo "cask/slack already installed"
else
    brew cask install slack
fi 

# zsh

if [ ! -f ~/.zshrc ]; then
    curl -L http://install.ohmyz.sh | sh

    ZSH_THEME_URL=http://suhinini.github.io/osx-installer/data/suhinini.zsh-theme
    ZSH_THEME_NAME=osx-installer

    wget -q $ZSH_THEME_URL -O ~/.oh-my-zsh/themes/$ZSH_THEME_NAME.zsh-theme

    sed -i.bak "s/^ZSH_THEME=.*$/ZSH_THEME=\"$ZSH_THEME_NAME\"/" ~/.zshrc
    sed -i.bak "s/^.*CASE_SENSITIVE=.*/CASE_SENSITIVE=false/" ~/.zshrc
    sed -i.bak "s/^plugins=.*/plugins=(git brew subl vagrant)/" ~/.zshrc

    rm .zshrc.bak
else 
    echo "zsh already installed"
fi

# Dock goodies

defaults write com.apple.Dock autohide-delay -float 0
defaults write com.apple.dock hide-mirror -bool true
defaults write com.apple.dock autohide-time-modifier -float 0

killall Dock

echo "dock configured"

# Launchpad goodies

defaults write com.apple.dock springboard-show-duration -int 0
defaults write com.apple.dock springboard-hide-duration -int 0

killall Dock

echo "launchpad configured"