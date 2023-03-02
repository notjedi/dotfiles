#!/usr/bin/env bash

mkdir -p ~/workspace/github.com/notjedi
git clone --recurse-submodules https://github.com/notjedi/dotfiles ~/workspace/github.com/notjedi/dotfiles

# symlink .config folder
find ~/workspace/github.com/notjedi/dotfiles/.config -maxdepth 1 -mindepth 1 -exec ln -fsv '{}' ~/.config \;

# symlink .local folder
mkdir -p ~/.local/share
ln -fsv ~/workspace/github.com/notjedi/dotfiles/.local/bin ~/.local/scripts
ln -fsv ~/workspace/github.com/notjedi/dotfiles/.local/share/fonts ~/.local/share
ln -fsv ~/workspace/github.com/notjedi/dotfiles/.local/share/applications ~/.local/share

# export all env vars and start X server on login
ln -fsv ~/workspace/github.com/notjedi/dotfiles/.config/shell/.profile ~/.zprofile

# copy /etc files
sudo cp -f ~/workspace/github.com/notjedi/dotfiles/etc/doas.conf /etc
sudo cp -f ~/workspace/github.com/notjedi/dotfiles/etc/pacman.conf /etc

# install dwm
cd ~/workspace/github.com/notjedi || (echo "failed to cd into workspace directory" && exit)
git clone https://github.com/notjedi/st && cd st && sudo make clean install && cd ..
git clone https://github.com/notjedi/dwm && cd dwm && sudo make clean install && cd ..
git clone https://github.com/notjedi/dwmblocks && cd dwmblocks && sudo make clean install && cd ..
cd ~ || exit

printf "\e[1;32mDone! Please log out and login again. \e[0m\n"
