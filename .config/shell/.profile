# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
# if [ -n "$BASH_VERSION" ]; then
#     # include .bashrc if it exists
#     if [ -f "$HOME/.bashrc" ]; then
# 	. "$HOME/.bashrc"
#     fi
# fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH="$HOME/.cargo/bin:$PATH"

# changing directory colors for 'ls' on hdd
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/scripts/polybar:$PATH"
export PATH="$HOME/src/android-studio/bin:$PATH"

export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export CODEEDITOR="code"
export TERMINAL="alacritty"
export HDD="/mnt/Seagate"
export BROWSER="brave"
export COLORTERM="truecolor"
export PAGER="less"
export WM="i3"

export PF_INFO="ascii title os kernel uptime pkgs memory palette"
# export PF_ASCII="linux"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export LESSHISTFILE="-"

[ "$(tty)" = "/dev/tty1" ] && ! pgrep Xorg && startx $HOME/.config/x11/xinitrc
