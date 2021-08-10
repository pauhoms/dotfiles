#!/bin/bash

rm -rf $(pwd)/.config/nvim
mkdir  $(pwd)/.config/nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

ln -s $(dirname $(readlink -f $0))/../editors/init.vim -r $(pwd)/.config/nvim/init.vim

