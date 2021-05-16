#!/bin/bash

echo "You need to run this with root."

echo "Installing and configuring things needed for i3"
cd ~/.config/i3/scripts
chmod -R +x *sh


echo \n Installing i3 status and pulling its config files
pacman -Sy i3status
cd ~/.config
git clone https://github.com/aliraeisdanaei/i3status


echo \n Installing i3 dependencies
pacman -Sy dmenu
pacman -Sy clipit
pacman -Sy xinput xorg-input
pacman -Sy curl
pacman -Sy xclip xdotool


echo \n\n"Getting vim configs"
cd ~/.config
git clone https://github.com/aliraeisdanaei/vim
cd ~/.config/vim

echo \n"Setting up the plugin installer."
chmod +x ./setup.sh && ./setup.sh


echo \n\n"Installing applications."
pacman -Sy vim gvim
pacman -Sy nnn 
pacman -Sy code 
pacman -Sy mpv moc
pacman -Sy fish
pacman -Sy git
pacman -Sy neofetch


echo \n"The base applications of Kde that are used are not included -- they have been assumed to have been shipped."


echo "Thank you for setting things up with us."
echo "Leben Sie wohl."

