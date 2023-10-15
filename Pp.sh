#!/bin/bash

#yes | yay -S hyprland-git
#yes | yay -S rofi

GRUB_THEME_PATH="/boot/grub/themes/theme.txt"

DOTCONFIGS_DIR=~/.config
HOMECONFIGS_DIR=~/

DOTCONFIGS=(kitty hypr rofi)
HOMECONFIGS=(face Wallpapers)

remove_existing_files_and_directories() {
  local array=("$@")
  for item in "${array[@]}"; do
    if [ -e "$HOME/$item" ]; then
      if [ -d "$HOME/$item" ]; then
        echo "Removing directory: $HOME/$item"
        rm -r "$HOME/$item"
      else
        echo "Removing file: $HOME/$item"
        rm "$HOME/$item"
      fi
    fi
  done
}

remove_existing() {
  echo "Removing existing files and directories in HOMECONFIGS..."
  remove_existing_files_and_directories "${HOMECONFIGS[@]}"
  
  echo "Removing existing files and directories in DOTCONFIGS..."
  remove_existing_files_and_directories "${DOTCONFIGS[@]}"
  
  echo "Removal complete."
}

install() {
  for file in "${DOTCONFIGS[@]}"; do
    echo "Installing $file..."
    mv "$file" "$DOTCONFIGS_DIR"
  done

  for file in "${HOMECONFIGS[@]}"; do
    echo "Installing $file..."
    mv "$file" "$HOME/.$file"
  done

  sudo mv Pp /boot/grub
  awk -i inplace '/GRUB_THEME=/ {gsub(/"[^"]+"/, "\"/boot/grub/themes/Pp/theme.txt\"")} 1' /etc/default/grub

  chmod +x ~/.config/rofi/launchers/type-7/launcher.sh

  sudo grub-mkconfig -o /boot/grub/grub.cfg
}

installDotfiles() {
  echo "I Be Poppin' Bottles"
  remove_existing
  install
  echo "Bottles N Champagne"
}

installDotfiles
