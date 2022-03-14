# changing directory colors for 'ls' on hdd
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export GIT_SSH_COMMAND="ssh -i $HOME/.ssh/git"
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.local/jedi/bin/" ]] && export PATH="$HOME/.local/jedi/bin:$PATH"
[[ -d "$HOME/.local/share/npm/bin" ]] && export PATH="$HOME/.local/share/npm/bin:$PATH"
[[ -d "$HOME/.local/share/cargo/bin" ]] && export PATH="$HOME/.local/share/cargo/bin:$PATH"
[[ -d "$HOME/.local/jedi/bin/dwmblocks" ]] && export PATH="$HOME/.local/jedi/bin/dwmblocks:$PATH"
[[ -d "$HOME/.local/share/gem/ruby/3.0.0/bin" ]] && export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
[[ -d "$HOME/.local/share/miniconda/condabin" ]] && export PATH="$HOME/.local/share/miniconda/condabin:$PATH"

export COLORTERM="truecolor"
export TERM="xterm-256color"
export BROWSER="librewolf"
export HDD="/mnt/Seagate"
export CODEEDITOR="code"
export READER="zathura"
export EDITOR="nvim"
export TERMINAL="st"
export VISUAL="nvim"
export PAGER="bat"
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

export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/npm/npmrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc"
export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/jupyter"
export CONDARC="${XDG_CONFIG_HOME:-$HOME/.config}/conda/condarc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:-/usr/lib/pkgconfig}"
export IPYTHONDIR="${XDG_CONFIG_HOME:-$HOME/.config}/ipython"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export CONDA_ROOT="${XDG_CONFIG_HOME:-$HOME/.config}/conda"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

export VSCODE_EXTENSIONS="${XDG_DATA_HOME:-$HOME/.local/share}/vscode/extensions"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export GRADLE_USER_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/gradle"
export VSCODE_PORTABLE="${XDG_DATA_HOME/$HOME/.local/share}/vscode"
export ELECTRUMDIR="${XDG_DATA_HOME:-$HOME/.local/share}/electrum"
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"

export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export _JAVA_AWT_WM_NONREPARENTING=1
export LESSHISTFILE="-"

export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
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
