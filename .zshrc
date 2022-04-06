fpath=($HOME/.zsh/zsh-completions/src $fpath)

autoload bashcompinit && bashcompinit

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit
complete -C "$HOME/.local/bin/aws_completer" aws

autoload -Uz promptinit && promptinit
prompt oliver boldblue

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

export EDITOR=/usr/bin/vim
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export PATH="/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/.local/bin"
export PYTHONDONTWRITEBYTECODE=1
export SAVEHIST=100000

if [ "$XDG_SESSION_TYPE" = x11 ]; then
  xset b off
  xset r rate 150 120
fi

# general aliases
alias g='git'
alias bc='bc -l'
alias egrep='egrep --color=auto --binary-files=without-match --exclude-dir=.svn --exclude-dir=.git'
alias grep='grep --color=auto --binary-files=without-match --exclude-dir=.svn --exclude-dir=.git'
alias ls='ls -F --color=auto'
alias os='openstack'
alias sshvm='ssh -t vm'

alias ga='git add'
alias gb='git branch -vv'
alias gci='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log --decorate=full --oneline'
alias gg='git log --all --decorate=full --stat --graph'
alias glr='git ls-remote'
alias gm='git merge'
alias gp='git pull'
alias gr='git rebase'
alias gri='git rebase -i'
alias gs='git status -sb'
alias gst='git status'

alias sc='shellcheck --format=gcc --enable=all --exclude=SC1090,SC1091,SC2250,SC3043'
alias sf='shfmt -i 2 -bn -ci'

alias tf='terraform'
