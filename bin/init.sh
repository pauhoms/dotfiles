#!/bin/bash

# Repositories
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt-get install -y

# Install common package
sudo apt-get install $(grep -vE "^\s*#" dotfiles/modules.txt  | tr "\n" " ")

# Dotly
bash <(curl -s https://raw.githubusercontent.com/CodelyTV/dotly/HEAD/installer)

# Install composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer
composer -v

# neovim
sudo bash $(dirname $(readlink -f $0))/neovim.sh

# alacritty
sudo bash $(dirname $(readlink -f $0))/alacritty.sh

# git
sudo bash $(dirname $(readlink -f $0))/git.sh

# docker
sudo bash $(dirname $(readlink -f $0))/docker.sh
