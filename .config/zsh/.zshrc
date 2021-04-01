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
precmd() { vcs_info }

autoload -U compinit && compinit
_comp_options+=(globdots)

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")'
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:approximate:*' max-errors 3 numeric
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}✗%f '
zstyle ':vcs_info:*' stagedstr '%F{green}🗸%f '
zstyle ':vcs_info:git*' formats "%F{blue}(%b)%f %u%c"
zstyle ':completion:*' menu select

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

conf() { du -a $HDD/Code/dotfiles/.config/* ~/.local/bin/* | awk '{ print $2 }' | sed "s|/mnt/Seagate/Code/dotfiles|$HOME|" | fzf | xargs -r $EDITOR }

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

# ALT-C - cd into the selected directory
fzf-cd-widget() {
  local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -maxdepth 3 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d,l  -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" fzf +m )"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="cd ${(q)dir}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}
zle -N fzf-cd-widget
bindkey '\ed' fzf-cd-widget

fzf-cd-all-widget() {
  local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -maxdepth 3 -path '.' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' -prune \
    -o -type d,l -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" fzf +m )"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="cd ${(q)dir}"
  zle accept-line
  local ret=$?
  zle reset-prompt
  unset dir # ensure this doesn't end up appearing in prompt expansion
  return $ret
}
zle -N fzf-cd-all-widget
bindkey '\ef' fzf-cd-all-widget

# CTRL-R - Paste the selected command from history into the command line
fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(fc -rl 1 | perl -ne 'print if !$seen{(/^\s*[0-9]+\**\s+(.*)/, $1)}++' |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort,ctrl-z:ignore $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" fzf) )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle reset-prompt
  return $ret
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget

[ -f ~/.config/shell/.aliases ] && source ~/.config/shell/.aliases
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
