# changing directory colors for 'ls' on hdd
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/dwmblocks:$PATH"
[ -f "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"

export COLORTERM="truecolor"
export TERM="xterm-256color"
export TERMINAL="alacritty"
export HDD="/mnt/Seagate"
export CODEEDITOR="code"
export READER="zathura"
export BROWSER="brave"
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export WM="dwm"

export PF_INFO="ascii title os kernel uptime pkgs memory palette"
# export PF_ASCII="linux"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_me=$(tput sgr0)

export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/jupyter"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export IPYTHONDIR="${XDG_CONFIG_HOME:-$HOME/.config}/ipython"
export CONDA_ROOT="${XDG_CONFIG_HOME:-$HOME/.config}/condarc"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

export VSCODE_EXTENSIONS="${XDG_DATA_HOME:-$HOME/.local/share}/vscode/extensions"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export GRADLE_USER_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/gradle"
export ELECTRUMDIR="${XDG_DATA_HOME:-$HOME/.local/share}/electrum"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:-/usr/lib/pkgconfig}"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"

GTK2_RC_FILES=/usr/share/themes/dracula/gtk-2.0/gtkrc
export PYTHONUSERBASE="/usr/local/bin"
export _JAVA_AWT_WM_NONREPARENTING=1 # fix for java applications in dwm
export LESSHISTFILE="-"

[ "$(tty)" = "/dev/tty1" ] && ! pgrep Xorg && startx $HOME/.config/x11/xinitrc
