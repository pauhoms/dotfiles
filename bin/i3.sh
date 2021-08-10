#!/bin/bash

rm -rf $(pwd)/.config/i3/
mkdir $(pwd)/.config/i3/


ln -s $(dirname $(readlink -f $0))/../os/config -r $(pwd)/.config/i3/config
