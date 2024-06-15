#!/bin/bash
# For the moment this script works well. Ansible could be something for the future.

DEPENDENCIES="tmux vim stow git"
DOTFILES_DIR="$(pwd)"

install_packages() {
  local packages=$1
  if command -v apt-get &>/dev/null; then
    apt-get update
    apt-get install -y $packages
  elif command -v dnf &>/dev/null; then
    dnf install -y $packages
  elif command -v pacman &>/dev/null; then
    pacman -Sy --noconfirm $packages
  elif command -v zypper &>/dev/null; then
    zypper install -y $packages
  else
    echo "Unsupported package manager. Please install $packages manually."
    exit 1
  fi
}

stow_dotfiles() {
  # Change to the dotfiles directory
  cd "$DOTFILES_DIR" || exit

  # Stow all directories
  stow */
}

# Check if running as root for package installations
if [ "$EUID" -ne 0 ]; then
  echo "Installing dependencies. You might be asked for your password."
  sudo bash -c "$(declare -f install_packages); install_packages \"$DEPENDENCIES\""
else
  install_packages "$DEPENDENCIES"
fi

stow_dotfiles

