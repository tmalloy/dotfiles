#!/bin/bash

set -e

cd

CMD=$(which yum || which apt-get || which brew)

function __install_if_missing {
    if [[ ! -x `which $1` ]]; then
        echo "Installing $1..."
        sudo $CMD install -y $1
    fi
}

if [[ $? -eq 0 ]]; then
    __install_if_missing vim
    __install_if_missing tmux
    __install_if_missing git
    __install_if_missing tig
fi

mkdir development

git clone https://github.com/tmalloy/dotfiles.git development/dotfiles

cd development/dotfiles

./install.sh

git submodule init && git submodule update

vim +PluginInstall +qall
