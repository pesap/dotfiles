#!/bin/bash

#==============================================================================
# `make.sh`
#
# This file creates my developer environment in a macOS and Linux system.
# Anything else is just fancy words, but for my sanity it downloads some of my
# most used programs and shell configurations.
#
#==============================================================================

# Beautifull print
echo "Starting dotfiles configuration!\n"

# Internal variables
directory=~/dotfiles
old_dir="~/dotfiles_old"

mkdir -p $old_dir

FILES=(
    bashrc
    config
    functions
    oh-my-zsh
    vimrc
    vimrc.global
    vimrc.local
    vimrc.maps
    vimrc.plugins
    zshrc
)


# Import function file
source functions

if [ "$(uname)" = "Darwin" ]; then

    echo "+ Running configuration for MacOS"

    # Check that brew is installed
    type -a brew > /dev/null  || brew_configure

    # Check that packages are installed
    formula_installed || xargs brew install < brew.txt  &> /dev/null

else
    echo "System not recognized yet"
fi

echo "+ Configure symlinks and directory"
create_symlink
echo "+ Finished installation!"

echo "\nEverything is ready! Cheers, pal!🍺"

