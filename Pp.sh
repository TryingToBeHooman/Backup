#!/bin/bash

yes | yay -S hyprland-git
yes | yay -S rofi

GRUB_THEME_PATH="/boot/grub/themes/theme.txt"

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

  mv Pp /boot/grub/themes
  
  sudo sed -i 's/GRUB_BACKGROUND=/#GRUB_BACKGROUND=/' /etc/default/grub
  sudo sed -i "s/#GRUB_THEME=/GRUB_THEME=$GRUB_THEME_PATH/" /etc/default/grub

  chmod +x ~/.config/rofi/launchers/type-7/launcher.sh

  sudo grub-mkconfig -o /boot/grub/grub.cfg
}

installDotfiles() {
  echo "I Be Poppin' Bottles"
  install_DOTCONFIGS
  echo "Bottles N Champagne"
}

install
