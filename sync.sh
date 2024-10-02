#!/bin/sh

cp -i ./neovim/init.lua "$HOME/.config/nvim/"
cp -i ./.bashrc "$HOME/.bashrc"

if command -v mksh; then
	cp -i ./.mkshrc "$HOME/.mkshrc"
fi
