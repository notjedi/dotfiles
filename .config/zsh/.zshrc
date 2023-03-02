autoload -U colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() { vcs_info }

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}✗%f '
zstyle ':vcs_info:*' stagedstr '%F{green}✔ %f ' # '●'
zstyle ':vcs_info:git*' formats "%F{blue}( %b)%f %u%c"

PS1="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )" # ﬦ   
PS1+=" %{$fg[cyan]%}%c%{$reset_color%} " # λ
PS1+='%F{blue}${vcs_info_msg_0_}%f'

setopt autocd
setopt correct
setopt autopushd
setopt prompt_subst
setopt share_history
setopt pushdignoredups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history
setopt hist_ignore_all_dups
setopt interactive_comments

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

bindkey -s '^a' '^ufend\n'

# https://stackoverflow.com/questions/17051123/source-a-file-in-zsh-when-entering-a-directory
autoload -U add-zsh-hook
load-local-conf() {
     [ -d ivy ] && condainit && conda activate ivy_dev
     [ -d pystk_gym ] && source venv/bin/activate
     [ -f go.mod ] && alias gg="go run ."
}
add-zsh-hook chpwd load-local-conf

[ -f ~/.config/zsh/atuin.zsh ] && source ~/.config/zsh/atuin.zsh
[ -f ~/.config/shell/.aliases ] && source ~/.config/shell/.aliases
[ -f ~/.config/zsh/fzf-widgets ] && source ~/.config/zsh/fzf-widgets
[ -f ~/.config/shell/.functions ] && source ~/.config/shell/.functions
[ -f /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh ] && source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
# [ -f /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ] && source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
