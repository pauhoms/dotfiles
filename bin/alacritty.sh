#!/bin/bash

rm -rf $(pwd)/.config/alacritty/
mkdir $(pwd)/.config/alacritty/


ln -s $(dirname $(readlink -f $0))/../programs/alacritty.yml -r $(pwd)/.config/alacritty/alacritty.yml
