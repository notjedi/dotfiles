#!/usr/bin/env bash

# time
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc

# locale
sed -i 's/\#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >>/etc/locale.conf

# hosts
echo "falcon1" >>/etc/hostname
{
	echo "127.0.0.1   localhost"
	echo "::1   localhost"
	echo "127.0.1.1   falcon1.localdomain falcon1"
} >>/etc/hosts

# password
echo root:password | chpasswd

########## Install ##########

# system essentials
pacman -S --no-confim grub grub-btrfs btrfs-progs efibootmgr networkmanager zsh \
	base-devel linux-headers xdg-user-dirs xdg-utils alsa-utils pipewire \
	pipewire-alsa pipewire-pulse pipewire-jack openssh rsync reflector os-prober \
	ntfs-3g pamixer sudo

# wifi and bluetooth stuff
# pacman -S grub network-manager-applet dialog wpa_supplicant mtools dosfstools \
# dnsutils bluez bluez-utils

# user programs
pacman -S --no-confirm neovim git alacritty unzip bat clipmenu opendoas ranger \
	lf rustup sccache scrcpy sxiv tealdeer thunar nautilus tmux transmission-cli \
	ueberzug zathura go python jq firefox dunst ffmpegthumbnailer flameshot \
	android-tools chromium bpython bat-extras bpytop btop xdg-utils xdg-user-dirs \
	man-pages man-db gtk3 gtk4 fd

# xorg
pacman -S --no-confirm xorg-server xwallpaper xorg-xinit xorg-server xcape \
	x11-ssh-askpass redshift maim python-pywal rofi xorg-xclipboard xclip

# GPU drivers
pacman -S --noconfirm nvidia nvidia-utils nvidia-settings
# pacman -S --noconfirm xf86-video-amdgpu

# wayland
# pacman -S --no-confirm wofi waybar

########## create dirs ##########
mkdir -p "$HOME/.local/share/gnupg"
mkdir -p "$HOME/.cache/zsh"

########## GRUB install ##########
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

########## Enable systemd units ##########
systemctl enable NetworkManager
systemctl enable reflector.timer
# systmectl enable --user pipewire

########## Crate user ##########
useradd --create-home --shell "$(which zsh)" --groups wheel jedi
echo jedi:password | chpasswd

########## Add user to sudoers ##########
echo "jedi ALL=(ALL) ALL" >>/etc/sudoers.d/jedi

printf "\e[1;32mDone! Type exit, umount -a and reboot. \e[0m\n"
