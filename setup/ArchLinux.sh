#!/bin/bash

# Elevate privileges
if [ $EUID != 0 ] && [ "$(command -v sudo)" ]; then
    sudo "$0" "$@"
    exit $?
fi

# Install official packages
pacman --noconfirm -Syu || exit $?
pacman --noconfirm -S cmake ninja clang clang-tools-extra boost || exit $?
