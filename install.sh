#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

POSTARCH_INSTALL=~/.local/share/postarch/install

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[31mPostArch installation failed!\e[0m"
  echo "You can retry by running: bash ~/.local/share/postarch/install.sh"
}

trap catch_errors ERR

show_logo() {
  clear
  cat .local/share/postarch/logo.txt
  echo
}

show_subtext() {
  echo "$1"
  echo
}

# Install prerequisites

# Configuration
show_logo
show_subtext "Prerequisites! [1/5]"
sleep 2

# Development
show_logo
show_subtext "Installing terminal tools [2/5]"
sleep 2

# Desktop
show_logo
show_subtext "Installing desktop tools [3/5]"
sleep 2

# Apps
show_logo
show_subtext "Installing default applications [4/5]"
sleep 2

# Updates
show_logo
show_subtext "Updating system packages [5/5]"
sudo updatedb
sudo pacman -Syu --noconfirm

# Reboot
show_logo
show_subtext "You're done! So we'll be rebooting now..."

sleep 2

# reboot
