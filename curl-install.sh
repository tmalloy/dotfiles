#!/bin/bash

set -e

cd

CMD=$(which yum || which apt-get || which brew)
if [[ $? -eq 0 ]]; then
    sudo $CMD install -y vim tmux
fi

mkdir development

git clone https://github.com/tmalloy/dotfiles.git development/dotfiles

cd development/dotfiles

./install.sh

git submodule init && git submodule update

vim +PluginInstall +qall
