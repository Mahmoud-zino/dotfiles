#!/bin/bash
set -e

echo "Creating symlinks with GNU Stow..."

cd ~/dotfiles

# Stow all configurations
stow i3
stow polybar
stow wezterm
stow nvim
stow tmux
stow zsh
stow rofi
stow tridactyl

echo "✓ All configurations symlinked!"
echo "⚠ Restart your session or run 'source ~/.zshrc'"
