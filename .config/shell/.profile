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

export PF_INFO="ascii title os kernel uptime pkgs memory palette"
export PF_ASCII="linux"

export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export CODEEDITOR="code"
export TERMINAL="alacritty"
export HDD="/mnt/Seagate"
export BROWSER="brave-browser"
export COLORTERM="truecolor"
export PAGER="less"
export WM="i3"
