#!/bin/bash
set -e

echo "Installing system packages..."

sudo apt update
sudo apt install -y \
  i3 \
  polybar \
  rofi \
  feh \
  picom \
  nitrogen \
  xclip \
  git \
  curl \
  wget \
  build-essential \
  stow \
  tmux \
  zsh \
  neovim \
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

echo "✓ System packages installed!"
