# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=0
unsetopt nomatch
bindkey -e

zstyle :compinstall filename '/home/rsw/.zshrc'

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

autoload -Uz compinit
compinit
# End of lines added by compinstall
[ -f "$HOME/.zaliases" ] && . "$HOME/.zaliases"

export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/games:/usr/local/sbin:/usr/sbin:/sbin"
export XAUTHORITY=$HOME/.Xauthority
umask 002

[ -f "$HOME/.zshrc.local" ] && . "$HOME/.zshrc.local"

# set var NOSIMPLEGIT to disable the simple git prompt

if [ -z "$NOSIMPLEGIT" ] ; then
    __simplegit() { : }
    setopt PROMPT_SUBST
    [ -f "$HOME/.simplegit.zsh" ] && . "$HOME/.simplegit.zsh"
    export PROMPT='%n@%m:%~$(__simplegit)%# '
fi
