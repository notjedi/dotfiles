[ -f "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"
# changing directory colors for 'ls' on hdd
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/dwmblocks:$PATH"

export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export CODEEDITOR="code"
export TERMINAL="alacritty"
export HDD="/mnt/Seagate"
export BROWSER="brave"
export COLORTERM="truecolor"
export PAGER="less"
export TERM="xterm-256color"
export WM="i3"

export PF_INFO="ascii title os kernel uptime pkgs memory palette"
# export PF_ASCII="linux"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
# Start bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
# Start stand out
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
# End standout
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# Start underline
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
# End Underline
export LESS_TERMCAP_ue=$(tput sgr0)
# End bold, blinking, standout, underline
export LESS_TERMCAP_me=$(tput sgr0)

export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/jupyter"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export IPYTHONDIR="${XDG_CONFIG_HOME:-$HOME/.config}/ipython"
export CONDA_ROOT="${XDG_CONFIG_HOME:-$HOME/.config}/condarc"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export LESSHISTFILE="-"

GTK2_RC_FILES=/usr/share/themes/dracula/gtk-2.0/gtkrc
export PYTHONUSERBASE="/usr/local/bin"
# dwm breaks java applications
export _JAVA_AWT_WM_NONREPARENTING=1

export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export VSCODE_EXTENSIONS="$HOME/.cache/vscode/extensions"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"

[ "$(tty)" = "/dev/tty1" ] && ! pgrep Xorg && startx $HOME/.config/x11/xinitrc
