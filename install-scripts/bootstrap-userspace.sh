#!/usr/bin/env bash

########## Rust install ##########
rustup install stable
rustup default stable

########## paru install ##########
cargo install paru
cargo install atuin
cargo install git-grab

########## AUR installs ##########
paru -S --noconfirm android-studio ctpv-git brave-bin downgrade librewolf-bin \
	yay viddy catppuccin-gtk-theme-mocha droidcam instaloader qrcp xdg-ninja-git \
	arttime-git gofumpt peerflix jellyfin-bin pfetch-git tremc vimv-git \
	visual-studio-code-bin golangci-lint-bin localsend-bin \
	zsh-fast-syntax-highlighting fzf-tab-git miniconda3

# wayland aur
# paru -S --noconfirm hyprland-nvidia wlsunset wlogout wlrobs-hg yofi \
# 	hyprpicker-git hyprpaper-git wpaperd swww mpvpaper geticons
# xdg-desktop-portal-hyprland-git

########## Install go packages ##########
go install github.com/nao1215/gup@latest
gup import

########## Install cargo packages ##########
cat ~/workspace/github.com/notjedi/dotfiles/install-scripts/pkgs/cargo/cargo-pkgs | xargs -r cargo install

########## Install pip packages ##########
pip3 install torch torchvision torchaudio

printf "\e[1;32mDone! \e[0m\n"
