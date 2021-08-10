#!/bin/bash

rm -rf $(pwd)/.gitconfig


ln -s $(dirname $(readlink -f $0))/../programs/gitconfig -r $(pwd)/.gitconfig
