#!/bin/sh

mkdir -p ~/.config
ln -sfn ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -sfn ~/.dotfiles/zsh/.config ~/.config/zsh
ln -sfn ~/.dotfiles/git ~/.config/git
ln -sfn ~/.dotfiles/zellij ~/.config/zellij
ln -sfn ~/.dotfiles/nvim ~/.config/nvim
