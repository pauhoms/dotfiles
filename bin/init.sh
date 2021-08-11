#!/bin/bash

# Repositories
sudo dnf update -y

# Install common package
sudo < $(dirname $(readlink -f $0))/../pakages.lst xargs dnf -y install

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

# i3
sudo bash $(dirname $(readlink -f $0))/i3.sh

# git
sudo bash $(dirname $(readlink -f $0))/git.sh

# docker
sudo bash $(dirname $(readlink -f $0))/docker.sh
