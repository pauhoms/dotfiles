# Dotfiles 📁

## Run dotfiles 📂
- `cd ~`
- `git clone https://github.com/pauhoms/dotfiles.git`
- `sudo bash dotfiles/bin/init.sh`

## QMK commands
- `nvim ~/dotfiles/qmk_firmware/keyboards/crkbd/keymaps/main`
- `qmk compile -kb crkbd -km main`
- `make crkbd/rev1:main:dfu`
