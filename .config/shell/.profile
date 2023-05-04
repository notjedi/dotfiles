#!/bin/bash

[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.local/scripts" ]] && export PATH="$HOME/.local/scripts:$PATH"
[[ -d "/opt/android-studio/bin" ]] && export PATH="/opt/android-studio/bin:$PATH"
[[ -d "$HOME/.local/share/go/bin" ]] && export PATH="$HOME/.local/share/go/bin:$PATH"
[[ -d "$HOME/.local/share/npm/bin" ]] && export PATH="$HOME/.local/share/npm/bin:$PATH"
[[ -d "$HOME/.local/share/cargo/bin" ]] && export PATH="$HOME/.local/share/cargo/bin:$PATH"
[[ -d "$HOME/.local/scripts/dwmblocks" ]] && export PATH="$HOME/.local/scripts/dwmblocks:$PATH"
[[ -d "$HOME/.local/share/gem/ruby/3.0.0/bin" ]] && export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
[[ -d "$HOME/.local/share/miniconda/condabin" ]] && export PATH="$HOME/.local/share/miniconda/condabin:$PATH"

export WM="dwm"
export VISUAL="nvim"
export TERMINAL="st"
export EDITOR="nvim"
export PAGER="bat -p"
export READER="zathura"
export CODEEDITOR="code"
export HDD="/mnt/samsung"
export BROWSER="librewolf"
export TERM="xterm-256color"
export COLORTERM="truecolor"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export SSH_ASKPASS=/usr/lib/ssh/ssh-askpass
export SSH_ASKPASS_REQUIRE=prefer
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
export GIT_SSH_COMMAND="ssh -i $HOME/.ssh/git"
export PF_INFO="ascii title os kernel uptime pkgs memory palette"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'

# wayland stuff
# export XDG_CURRENT_DESKTOP="hyprland"
# export WLR_NO_HARDWARE_CURSORS=1
# export WAYLAND_DISPLAY="wayland-0"
# export XDG_SESSION_TYPE="wayland"

export XDG_CURRENT_DESKTOP="dwm"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_se=$(
	tput rmso
	tput sgr0
)
export LESS_TERMCAP_so=$(
	tput bold
	tput setaf 3
)
export LESS_TERMCAP_md=$(
	tput bold
	tput setaf 2
)
export LESS_TERMCAP_mb=$(
	tput bold
	tput setaf 2
)
export LESS_TERMCAP_us=$(
	tput smul
	tput bold
	tput setaf 1
)

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export CONDA_ROOT="$XDG_CONFIG_HOME/conda"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export CONDARC="$XDG_CONFIG_HOME/conda/condarc"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"

export GOPATH="$XDG_DATA_HOME/go"
export ANDROID_HOME="/opt/android-sdk"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export STACK_ROOT="$XDG_DATA_HOME/stack"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export PARALLEL_HOME="$XDG_DATA_HOME/parallel"
export VSCODE_PORTABLE="$XDG_DATA_HOME/vscode"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export VSCODE_EXTENSIONS="$XDG_DATA_HOME/vscode/extensions"
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export FLUTTER_GIT_URL="ssh://git@github.com/flutter/flutter.git"

export LESSHISTFILE="-"
export RUSTC_WRAPPER="sccache"
export GRAB_HOME="$HOME/workspace"
export _JAVA_AWT_WM_NONREPARENTING=1
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=🔗:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.webp=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpe=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.tif=🖼:\
*.tiff=🖼:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.m=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.wav=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.mov=🎥:\
*.mpg=🎥:\
*.wmv=🎥:\
*.m4b=🎥:\
*.flv=🎥:\
*.vid=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.gba=🎮:\
*.nes=🎮:\
*.gdi=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
*.jar=♨:\
*.java=♨:\
"

[ "$(tty)" = "/dev/tty1" ] && ! pgrep Xorg && startx $HOME/.config/x11/xinitrc
