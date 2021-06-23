autoload -U colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}✗%f '
zstyle ':vcs_info:*' stagedstr '%F{green}✔%f '
zstyle ':vcs_info:git*' formats "%F{blue}(%b)%f %u%c"

PS1="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PS1+=" %{$fg[cyan]%}%c%{$reset_color%} "
PS1+='%F{blue}${vcs_info_msg_0_}%f'

pfetch

setopt interactive_comments
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt prompt_subst
setopt autocd

HISTSIZE=100000000
SAVEHIST=100000000
HISTFILE=~/.cache/zsh/history

autoload -U compinit && compinit
_comp_options+=(globdots)

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")'
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:approximate:*' max-errors 3 numeric
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' menu select

# preview directory's content with exa when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
# zstyle ':fzf-tab:*' switch-group ',' '.'

# Change cursor shape for different vi modes.
# function zle-keymap-select () {
#     case $KEYMAP in
#         vicmd) echo -ne '\e[1 q';;      # block
#         viins|main) echo -ne '\e[5 q';; # beam
#     esac
# }
# zle -N zle-keymap-select
# echo -ne '\e[5 q' # Use beam shape cursor on startup.

# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history

vi-yank-arg() {
  NUMERIC=1 zle .vi-add-next
  zle .insert-last-word
}
zle -N vi-yank-arg
bindkey -M vicmd _ vi-yank-arg

# use vi mode
bindkey -v
KEYTIMEOUT=40
bindkey -M viins 'jk' vi-cmd-mode
bindkey -v '^?' backward-delete-char

# edit command in vim
autoload edit-command-line;
zle -N edit-command-line
bindkey '^e' edit-command-line

function countdown(){
    date1=$((`date +%s` + $1)); 
    while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
    done
}

function stopwatch() {
    date1=`date +%s`; 
    while true; do 
        echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
        sleep 0.1
    done
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jedi/.local/share/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jedi/.local/share/miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/jedi/.local/share/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/jedi/.local/share/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[ -f /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh ] && source /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
[ -f ~/.config/zsh/fzf-widgets ] && source ~/.config/zsh/fzf-widgets
[ -f ~/.config/shell/.aliases ] && source ~/.config/shell/.aliases
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
