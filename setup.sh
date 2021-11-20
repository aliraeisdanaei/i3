#!/bin/bash

echo "You need to run this with root."

echo "Installing and configuring things needed for i3"
cd ~/.config/i3/scripts
chmod -R +x *sh


echo \n"Installing i3 status and pulling its config files"
pacman -Sy i3status
cd ~/.config
git clone https://github.com/aliraeisdanaei/i3status

echo \n "Setting up gdmenu"
cd ~
mkdir Projects
cd ~/Projects
git clone https://github.com/rliang/gdmenu
cd gdmenu
make && sudo make install


echo \n"Installing i3 dependencies"
pacman -Sy clipit
pacman -Sy mplayer
pacman -Sy xinput xorg-input xorg-xwininfo
pacman -Sy curl
pacman -Sy nodejs npm
pacman -Sy xclip xdotool
pacman -Sy feh
pacman -Sy picom
pacman -Sy redshift
pip install autotiling

echo \n\n"Installing applications."
pacman -Sy vim gvim nvim
pacman -Sy vifm
pacman -Sy code 
pacman -Sy mpv moc
pacman -Sy fish
pacman -Sy git
pacman -Sy neofetch
pacman -Sy htop

echo \n\n"Getting vim configs"
cd ~/.config
git clone https://github.com/aliraeisdanaei/vim
cd ~/.config/vim
echo \n"Setting up the plugin installer."
chmod +x ./setup.sh && ./setup.sh

echo \n\n"Getting nvim configs"
cd ~/.config
git clone https://github.com/aliraeisdanaei/nvim
cd ~/.config/nvim
echo \n"Setting up the plugin installer."
chmod +x ./setup.sh && chmod +x ./setup2.sh && ./setup.sh


echo \n"The base applications of Kde that are used are not included -- they have been assumed to have been shipped."

echo "Thank you for setting things up with us."
echo "Leben Sie wohl."

