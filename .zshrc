fpath=($HOME/.zsh/zsh-completions/src $fpath)

autoload bashcompinit && bashcompinit

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit
complete -C aws_completer aws

source /usr/share/powerline/bindings/zsh/powerline.zsh

autoload -Uz colors && colors
eval "$(dircolors -b)"

stty stop undef

setopt autocd interactivecomments histignorealldups sharehistory

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey -d
bindkey -e
bindkey '\e[1~' beginning-of-line
bindkey '\e[H' beginning-of-line
bindkey '\e[7~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[F' end-of-line
bindkey '\e[8~' end-of-line
bindkey '\e[3~' delete-char

umask 0022

export EDITOR=vim
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export MAIL=/var/spool/mail/$USER
export MAILCHECK=10
export PAGER='less -R'
export PATH="/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/.local/bin"
export PYTHONDONTWRITEBYTECODE=1
export SAVEHIST=100000

if [[ $XDG_SESSION_TYPE == x11 ]]; then
  xset b off
  xset r rate 150 100
fi

# general
alias bc='bc -l'
alias egrep='egrep --color=auto --binary-files=without-match --exclude-dir=.svn --exclude-dir=.git'
alias grep='grep --color=auto --binary-files=without-match --exclude-dir=.svn --exclude-dir=.git'
alias ls='ls -F --color=auto'
alias ll='ls -laF --color=auto'

# git
alias ga='git add'
alias gb='git branch -vv'
alias gc='git clone'
alias gci='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gg='git log --all --decorate=full --stat --graph'
alias gl='git log --decorate=full --oneline'
alias glr='git ls-remote'
alias gm='git merge'
alias gp='git pull'
alias gr='git rebase'
alias gri='git rebase -i'
alias gs='git status -sb'
alias gst='git status'

# sca
alias sc='shellcheck --format=gcc --enable=all --exclude=SC1090,SC1091,SC2250,SC2312,SC3043'
alias sf='shfmt -i 2 -ci -s'
pc() {
  flake8 --ignore E501 "$@"
  pylint --confidence=HIGH --disable=C "$@"
}
alias pf='black'

# terraform
alias tf='terraform'
alias tfa='terraform apply'
alias tfi='terraform init'
alias tfp='terraform plan'
