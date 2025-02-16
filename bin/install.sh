#!/bin/bash

echo "Starting install script, please grant sudo access..."
sudo -v

# Brew
which -s brew
if [[ $? != 0 ]] ; then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Stow
which -s stow
if [[ $? != 0 ]] ; then
  echo "Installing stow..."
  brew install stow
fi

echo "Cloning dotfiles..."
git clone https://github.com/hungps/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git submodule update --init --recursive
stow .

echo "Installing Homebrew Bundle..."
brew bundle install --file=~/Brewfile;

echo "Install zsh...."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Switching to zsh
chsh -s "$(which zsh)"

