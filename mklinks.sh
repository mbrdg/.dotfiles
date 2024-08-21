#!/bin/sh

mkdir -p ~/.config
ln -sfn ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -sfn ~/.dotfiles/zsh/.config ~/.config/zsh
ln -sfn ~/.dotfiles/git ~/.config/git
ln -sfn ~/.dotfiles/tmux ~/.config/tmux
ln -sfn ~/.dotfiles/nvim ~/.config/nvim
