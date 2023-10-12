DOTCONFIGS_DIR=~/.config

# Check if the DOTCONFIGS directory exists and remove it if it does
if [ -d "$DOTCONFIGS_DIR" ]; then
  echo "DOTCONFIGS directory already exists. Deleting it..."
  rm -r "$DOTCONFIGS_DIR"
fi

DOTCONFIGS=(kitty hypr rofi)

install_DOTCONFIGS() {
  for file in "${DOTCONFIGS[@]}"; do
    echo "Installing $file..."
    cp "$DOTCONFIGS_DIR/$file" ~/
  done
}

install() {
  echo "I Be Poppin' Bottles"
  install_DOTCONFIGS
  echo "Bottles N Champagne"
}

install
