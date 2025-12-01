#!/bin/bash
set -e

echo "Installing system packages..."

sudo apt update
sudo apt install -y \
  i3 \
  polybar \
  rofi \
  feh \
  nitrogen \
  xclip \
  git \
  curl \
  wget \
  build-essential \
  stow \
  tmux \
  zsh \
  ranger \
  htop \
  ripgrep \
  fd-find \
  fzf \
  firefox \
  fonts-font-awesome \
  fonts-powerline \
  python3-pip \
  unzip

chsh -s /usr/bin/zsh || echo "Run 'chsh -s /usr/bin/zsh' manually if this fails"

echo "✓ System packages installed!"
