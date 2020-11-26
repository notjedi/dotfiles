# Path to your oh-my-zsh installation.
export ZSH="/home/jedi/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# setopt correct

bindkey -v
# bindkey jk \e
# bindkey -M viins 'jk' vi-cmd-mode

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

DISABLE_AUTO_TITLE="true"

plugins=(
    git
    dirhistory
    zsh-autosuggestions
    z
    # extract
    # last-working-dir
    )

[ -f ~/.aliases ] && source /home/jedi/.aliases

source $ZSH/oh-my-zsh.sh
source /home/jedi/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

pfetch
