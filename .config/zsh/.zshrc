autoload -U colors && colors

PS1="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PS1+=" %{$fg[cyan]%}%c%{$reset_color%} "
PS1+="${vcs_info_msg_0_}"

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

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}
autoload -U compinit && compinit
_comp_options+=(globdots)

zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")'
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:approximate:*' max-errors 3 numeric
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}✗%f '
zstyle ':vcs_info:*' stagedstr '%F{green}🗸%f '
zstyle ':vcs_info:git*' formats "%F{blue}(%b)%f %u%c"
zstyle ':completion:*' menu select

# use vi mode
bindkey -v
KEYTIMEOUT=40
bindkey -M viins 'jk' vi-cmd-mode
bindkey -v '^?' backward-delete-char

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

vi-yank-arg() {
  NUMERIC=1 zle .vi-add-next
  zle .insert-last-word
}
zle -N vi-yank-arg
bindkey -M vicmd _ vi-yank-arg

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

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

[ -f ~/.config/shell/.aliases ] && source ~/.config/shell/.aliases
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
