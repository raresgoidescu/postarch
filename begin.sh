#!/usr/bin/env bash

set -euo pipefail

REPO="${REPO:-raresgoidescu/starch}"
INSTALL_DIR="$HOME/.local/share/starch"

ansi_art='
     .x+=:.        s                                                  
    z`    ^%      :8                                         .uef^"   
       .   <k    .88                   .u    .             :d88E      
     .@8Ned8"   :888ooo       u      .d88B :@8c        .   `888E      
   .@^%8888"  -*8888888    us888u.  ="8888f8888r  .udR88N   888E .z8k 
  x88:  `)8b.   8888    .@88 "8888"   4888>'\''88"  <888'\''888k  888E~?888L
  8888N=*8888   8888    9888  9888    4888> '\''    9888 '\''Y"   888E  888E
   %8"    R88   8888    9888  9888    4888>      9888       888E  888E
    @8Wou 9%   .8888Lu= 9888  9888   .d888L .+   9888       888E  888E
  .888888P`    ^%888*   9888  9888   ^"8888*"    ?8888u../  888E  888E
  `   ^"F        '\''Y"    "888*""888"     "Y"       "8888P'\''  m888N= 888>
                         ^Y"   ^Y'\''                  "P'\''     `Y"   888 
                                                                 J88" 
                                                                 @%   
                                                               :"     '

clear && echo -e "$ansi_art\n"

sudo pacman -Sy --noconfirm --needed git gum

echo "Cloning Starch from: https://github.com/${REPO}.git"
rm -rf "$INSTALL_DIR"
git clone --depth 1 "https://github.com/${REPO}.git" "$INSTALL_DIR"

# Verify integrity
# if command -v sha256sum >/dev/null && [ -f "$INSTALL_DIR/checksums.txt" ]; then
#     (cd "$INSTALL_DIR" && sha256sum -c checksums.txt)
# fi

read -rp "Have you reviewed the script before running? [y/N] " review
[[ "$review" =~ ^[Yy]$ ]] || exit 1

read -rp "Proceed with installation? [y/N] " confirm
[[ "$confirm" =~ ^[Yy]$ ]] || exit 1

source "$INSTALL_DIR/install.sh"
