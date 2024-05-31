#!/bin/bash

echo "Starting install script, please grant sudo access..."
sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

echo "Cloning dotfiles..."
git clone https://github.com/hungps/dotfiles.git ~/.dotfiles
cd .dotfiles || exit
git submodule update --init --recursive

echo "Installing homebrew..."
if [ -f "/usr/local/bin/brew" ]; then
  echo "Homebrew is installed, nothing to do here"
else
  echo "Homebrew is not installed, installing now"
  echo "This may take a while"
  echo "Homebrew requires osx command lines tools, please download xcode first"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Installing all brew dependencies
brew bundle install

# Install tmux tpm
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Switching to zsh
chsh -s "$(which zsh)"
