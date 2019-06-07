autoload -Uz colors && colors
autoload -Uz compinit && compinit
autoload -Uz edit-command-line
autoload -Uz vcs_info

export EDITOR="vim"
export GOPATH="$HOME/Development/go"
export LANG="en_US.UTF-8"
export LC_ALL="$LANG"
export PATH="$HOME/bin:$GOPATH/bin:/usr/local/bin:$PATH"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=65536
KEYTIMEOUT=1
SAVEHIST=$HISTSIZE

alias dcom="docker-compose"
alias ga="git add"
alias gap="git add -p"
alias gb="git branch"
alias gc="git commit"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gdc="git diff --cached"
alias glg="git log --graph --oneline"
alias gp="git push"
alias gpf="git push --force"
alias gr="git rebase"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias gri="git rebase -i"
alias gs="git status"
alias hist="history -Di"
alias la="ls -AGh"
alias ls="ls -Gh"
alias ll="ls -AGhl"
alias tmux="tmux -2"

function zle-line-init zle-keymap-select {
    VIM="%{$fg[green]%}${${KEYMAP/vicmd/N}/(main|viins)/I}%{$reset_color%}"
    PROMPT="%{$fg[blue]%}%~%{$reset_color%} $VIM " 
    zle reset-prompt
}

zle -N edit-command-line
zle -N zle-line-init
zle -N zle-keymap-select

bindkey -v
bindkey -M vicmd v edit-command-line
bindkey '^?' backward-delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[3~' delete-char
bindkey '^[[F' end-of-line

precmd() {
  vcs_info
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%u%c %{$fg[blue]%}%b%{$reset_color%}"
zstyle ':vcs_info:*' stagedstr "%{$fg[green]%}*%{$reset_color%}"
zstyle ':vcs_info:*' unstagedstr "%{$fg[red]%}*%{$reset_color%}"
zstyle ':vcs_info:*' branchformat "%r"

setopt PROMPT_SUBST
PROMPT="%{$fg[blue]%}%~%{$reset_color%} %{$fg[green]%}I%{$reset_color%} " 
RPROMPT='${vcs_info_msg_0_}'

setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt NO_BEEP
setopt NO_HIST_BEEP
setopt SHARE_HISTORY

# Commented because it's very slow.
# https://github.com/pypa/pipenv/issues/1247
# eval "$(pipenv --completion)"
