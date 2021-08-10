#!/bin/bash

# Install common package
dnf install -y $(cat $(dirname $(readlink -f $0))/../modules.txt)

# Dotly
bash <(wget -qO- https://raw.githubusercontent.com/CodelyTV/dotly/HEAD/installer)

# Install composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer
composer -v

# neovim
bash $(dirname $(readlink -f $0))/neovim.sh

# alacritty
bash $(dirname $(readlink -f $0))/alacritty.sh

# i3
bash $(dirname $(readlink -f $0))/i3.sh

