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
  tte -i ~/.local/share/postarch/logo.txt --frame-rate ${2:-120} ${1:-expand}
  echo
}

show_subtext() {
  echo "$1" | tte --frame-rate ${3:-640} ${2:-wipe}
  echo
}

# Install prerequisites

# Configuration
show_logo beams 240
show_subtext "Let's install Omarchy! [1/5]"
sleep 2

# Development
show_logo decrypt 920
show_subtext "Installing terminal tools [2/5]"
sleep 2

# Desktop
show_logo slice 60
show_subtext "Installing desktop tools [3/5]"
sleep 2

# Apps
show_logo expand
show_subtext "Installing default applications [4/5]"
sleep 2

# Updates
show_logo highlight
show_subtext "Updating system packages [5/5]"
sudo updatedb
sudo pacman -Syu --noconfirm

# Reboot
show_logo laseretch 920
show_subtext "You're done! So we'll be rebooting now..."

sleep 2

# reboot
