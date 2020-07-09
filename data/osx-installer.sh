#!/bin/bash

# USAGE: curl -L http://suhinini.github.io/osx-installer/data/osx-installer.sh | sh

# installing brew

if ! hash brew 2>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
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

if brew list -1 | grep -q "^tree\$"; then
    echo "brew/tree already installed"
else
    brew install tree
fi

if brew list -1 | grep -q "^z\$"; then
    echo "brew/z already installed"
else
    brew install z
fi

if brew list -1 | grep -q "^pyenv\$"; then
    echo "brew/pyenv already installed"
else
    brew install pyenv
fi

# cask goodies

if brew cask list -1 | grep -q "^google-chrome\$"; then
    echo "cask/google-chrome already installed"

    # Removing stupid 2-finger back navigation
    defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE
else
    brew cask install google-chrome
fi

if brew cask list -1 | grep -q "^visual-studio-code$"; then
    echo "cask/visual-studio-code already installed"
else
    brew cask install visual-studio-code
fi

if brew cask list -1 | grep -q "^iterm2$"; then
    echo "cask/iterm2 already installed"
else
    brew cask install iterm2
fi 

if brew cask list -1 | grep -q "^clipy$"; then
    echo "cask/clipy already installed"
else
    brew cask install clipy
fi 

if brew cask list -1 | grep -q "^mtmr$"; then
    echo "cask/mtmr already installed"
else
    brew cask install mtmr
fi 

if brew cask list -1 | grep -q "^slack$"; then
    echo "cask/slack already installed"
else
    brew cask install slack
fi 

if brew cask list -1 | grep -q "^telegram$"; then
    echo "cask/telegram already installed"
else
    brew cask install telegram
fi

# zsh

if [ ! -f ~/.zshrc ]; then
    curl -L http://install.ohmyz.sh | sh

    ZSH_THEME_URL=http://suhinini.github.io/osx-installer/data/suhinini.zsh-theme
    ZSH_THEME_NAME=osx-installer

    wget -q $ZSH_THEME_URL -O ~/.oh-my-zsh/themes/$ZSH_THEME_NAME.zsh-theme

    sed -i.bak "s/^ZSH_THEME=.*$/ZSH_THEME=\"$ZSH_THEME_NAME\"/" ~/.zshrc
    sed -i.bak "s/^.*CASE_SENSITIVE=.*/CASE_SENSITIVE=false/" ~/.zshrc
    sed -i.bak "s/^plugins=.*/plugins=(git brew)/" ~/.zshrc

    # run z tool
    sed -i.bak "/^.*\/z\.sh.*$/d" ~/.zshrc
    echo ". `brew --prefix`/etc/profile.d/z.sh" >> ~/.zshrc
    echo "" > ~/.z

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

# Keyboard goodies

defaults write -g InitialKeyRepeat -int 12
defaults write -g KeyRepeat -int 2

echo "keyboard configured"
