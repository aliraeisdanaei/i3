#!/bin/bash

echo "You need to run this with root."

echo "Setting up yay"
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R tecmint:tecmint ./yay-git
cd yay-git
makepkg -si

echo "Installing and configuring things needed for i3"
cd ~/.config/i3/scripts
chmod -R +x *sh


echo \n"Installing i3 status and pulling its config files"
pacman -Sy i3status
cd ~/.config
git clone https://github.com/aliraeisdanaei/i3status

# echo \n "Setting up gdmenu"
# cd ~
# mkdir Projects
# cd ~/Projects
# git clone https://github.com/rliang/gdmenu
# cd gdmenu
# make && sudo make install


echo \n"Installing i3 dependencies"
pacman -S clipit
pacman -S mplayer
pacman -S xinput xorg-input xorg-xwininfo
pacman -S curl
pacman -S nodejs npm
pacman -S xclip xdotool
pacman -S feh
pacman -S picom
pacman -S redshift
pacman -S pasystray
yay -S blueman

pip install autotiling

echo \n\n"Installing applications."
pacman -S vim gvim nvim
pacman -S vifm
pacman -S code
pacman -S mpv moc
pacman -S fish
pacman -S git
pacman -S neofetch
pacman -S htop
pacman -S mpv

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

