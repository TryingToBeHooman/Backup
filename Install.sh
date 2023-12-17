#!/bin/bash

yay -S hyprland-git
yay -S wofi
yay -S cava

sudo pacman -S kitty waybar neofetch lolcat htop btop 

GRUB_THEME_PATH="/boot/grub/themes/theme.txt"

DOTCONFIGS_DIR=~/.config
HOMECONFIGS_DIR=~/

DOTCONFIGS=(kitty hypr wofi cava waybar neofetch)
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

  sudo mv Pp /boot/grub/themes
  sudo rm -r /etc/default/grub
  sudo mv grub /etc/default
  chmod +x ~/.config/rofi/launchers/type-7/launcher.sh
  sudo grub-mkconfig -o /boot/grub/grub.cfg

  yes | sudo pacman -S lightdm-webkit2-greeter
  sudo mv lightdm-webkit2-greeter.conf /etc/lightdm/
  sudo mv Evo /usr/share/lightdm-webkit/themes/

  mv Luffy.txt ~/.config

  echo 'neofetch | lolcat' >> ~/.bashrc
}

installDotfiles() {
  remove_existing
  install
  echo "I Be Poppin' Bottles"
  echo "Bottles N Champagne"
}

installDotfiles

