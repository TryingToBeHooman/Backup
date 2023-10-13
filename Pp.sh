#!/bin/bash

DOTCONFIGS_DIR=~/.config
HOMECONFIGS_DIR=~/

if [ -d "$DOTCONFIGS_DIR" ]; then
  echo "DOTCONFIGS directory already exists. Deleting it..."
  rm -r "$DOTCONFIGS_DIR"
fi

if [ -d "HOMECONFIGS_DIR" ]; then
  echo "HOMECONFIGS directory already exists. Deleting it..."
  rm -r "$HOMECONFIGS_DIR"
fi

DOTCONFIGS=(kitty hypr rofi)
HOMECONFIGS=(face Wallpapers)

installDotfiles() {
  for file in "${DOTCONFIGS[@]}"; do
    echo "Installing $file..."
    mv -r "$DOTCONFIGS_DIR/$file" ~/
  done

  for file in "${HOMECONFIGS[@]}"; do
    echo "Installing $file..."
    mv -r "$HOMECONFIGS/$file" "$HOMECONFIGS/.$file"
  done

  
}

installDotfiles() {
  echo "I Be Poppin' Bottles"
  install_DOTCONFIGS
  echo "Bottles N Champagne"
}

install
