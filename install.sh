#!/usr/bin/env bash

SCRIPT_DIR=`pwd`

ln -snf $SCRIPT_DIR/.zshrc ~/.zshrc
ln -snf $SCRIPT_DIR/bin ~/bin

mkdir -p ~/.config
ln -snf $SCRIPT_DIR/.config/nvim ~/.config/nvim
ln -snf $SCRIPT_DIR/.config/git ~/.config/git
ln -snf $SCRIPT_DIR/.config/tig ~/.config/tig
ln -snf $SCRIPT_DIR/.config/tmux ~/.config/tmux
ln -snf $SCRIPT_DIR/.config/zsh ~/.config/zsh
ln -snf $SCRIPT_DIR/.config/atuin ~/.config/atuin
ln -snf $SCRIPT_DIR/.config/starship.toml ~/.config/starship.toml
ln -snf $SCRIPT_DIR/.config/clojure ~/.config/clojure

mkdir -p ~/.config/karabiner
ln -snf $SCRIPT_DIR/.config/karabiner.edn ~/.config/karabiner.edn
ln -snf $SCRIPT_DIR/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json

