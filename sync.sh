#!/bin/sh

if ! diff ./nvim/init.lua "$HOME/.config/nvim/" > /dev/null; then
	cp -i ./nvim/init.lua "$HOME/.config/nvim/"
fi

if ! diff ./.bashrc "$HOME/.bashrc" > /dev/null; then
	cp -i ./.bashrc "$HOME/.bashrc"
fi

if command -v mksh > /dev/null && ! diff ./.mkshrc "$HOME/.mkshrc" > /dev/null; then
	cp -i ./.mkshrc "$HOME/.mkshrc"
fi

if ! diff ./starship.toml "$HOME/.config/starship.toml" > /dev/null; then
	cp -i ./starship.toml "$HOME/.config/starship.toml"
fi
