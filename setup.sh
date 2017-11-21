#!/bin/bash
# Installs some software if it isn't present already.
# Download BetterTouchTool
if [ -e /Applications/BetterTouchTool.app ]; then
  echo "BetterTouchTool already installed."
else
  (cd ~/Downloads)
  (curl -O http://mynewkangaroo.com/fifafu/btt0.967.zip)
  (unzip btt0.967.zip)
  (mv ./BetterTouchTool.app /Applications/BetterTouchTool.app)
  echo "BetterTouchTool has been placed in your Applications folder, please open it."
fi

# Make sure Homebrew is installed
if hash brew 2>/dev/null; then
  echo "Homebrew already installed."
else
  (ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)")
  (export PATH="/usr/local/bin:$PATH")
fi

# Install Git if necessary

if hash git 2>/dev/null; then
  echo "Git already installed"
else
  brew install git
fi

# Configure Git

git config --global user.name "Bjorn Mulder"
git config --global user.email "bjrnmulder@gmail.com"
git config --global core.editor vim
git config --global core.page less
git config --global color.ui true
