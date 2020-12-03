# Path to your oh-my-zsh installation.
export ZSH="/home/jedi/.oh-my-zsh"
ZSH_THEME="robbyrussell"

pfetch

# auto correct commands
# setopt correct
setopt interactive_comments
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

HISTSIZE=100000000
SAVEHIST=100000000
HISTFILE=~/.cache/zsh/history

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

DISABLE_AUTO_TITLE="true"

plugins=(
    git
    dirhistory
    zsh-autosuggestions
    colored-man-pages
    # last-working-dir
    # extract
    # z
    )

source $ZSH/oh-my-zsh.sh

compinit
_comp_options+=(globdots)

# use vi mode
bindkey -v
KEYTIMEOUT=40
bindkey -M viins 'jk' vi-cmd-mode

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

vi-yank-arg() {
  NUMERIC=1 zle .vi-add-next
  zle .insert-last-word
}
zle -N vi-yank-arg
bindkey -M vicmd _ vi-yank-arg

# Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# echo -ne '\e[5 q' # Use beam shape cursor on startup.

[ -f ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.config/shell/.aliases ] && source ~/.config/shell/.aliases

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
