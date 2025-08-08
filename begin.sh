#!/usr/bin/env bash

ansi_art='                             .x+=:.        s                                                  
                            z`    ^%      :8                                         .uef^"   
 .d``                u.        .   <k    .88                   .u    .             :d88E      
 @8Ne.   .u    ...ue888b     .@8Ned8"   :888ooo       u      .d88B :@8c        .   `888E      
 %8888:u@88N   888R Y888r  .@^%8888"  -*8888888    us888u.  ="8888f8888r  .udR88N   888E .z8k 
  `888I  888.  888R I888> x88:  `)8b.   8888    .@88 "8888"   4888>'\''88"  <888'\''888k  888E~?888L
   888I  888I  888R I888> 8888N=*8888   8888    9888  9888    4888> '\''    9888 '\''Y"   888E  888E
   888I  888I  888R I888>  %8"    R88   8888    9888  9888    4888>      9888       888E  888E
 uW888L  888'\'' u8888cJ888    @8Wou 9%   .8888Lu= 9888  9888   .d888L .+   9888       888E  888E
'\''*88888Nu88P   "*888*P"   .888888P`    ^%888*   9888  9888   ^"8888*"    ?8888u../  888E  888E
~ '\''88888F`       '\''Y"      `   ^"F        '\''Y"    "888*""888"     "Y"       "8888P'\''  m888N= 888>
   888 ^                                         ^Y"   ^Y'\''                  "P'\''     `Y"   888 
   *8E                                                                                   J88" 
   '\''8>                                                                                   @%   
    "                                                                                  :"     '

clear

echo -e "\n$ansi_art\n"

sudo pacman -Sy --noconfirm --needed git

REPO="${REPO:-raresgoidescu/postarch}"

echo -e "\nCloning PostArch from: https://github.com/${REPO}.git"

rm -rf ~/.local/share/postarch/
git clone "https://github.com/${REPO}.git" ~/.local/share/postarch >/dev/null

# Use custom branch if instructed
if [[ -n "$POSTARCH_REF" ]]; then
  echo -e "\eUsing branch: $POSTARCH_REF"

  cd ~/.local/share/postarch
  git fetch origin "${POSTARCH_REF}" && git checkout "${POSTARCH_REF}"
  cd -
fi

echo -e "\nStarting..."

source ~/.local/share/postarch/install.sh
