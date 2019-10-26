#!/usr/bin/env zsh

alias dot="cd $DOT"
alias hw="cd $HOME/homewiki"
alias ss="cd $HOME/side/site"
alias mc="cd $MC"
alias mcgo="cd $MCGO"
alias op="cd $MC/ops/puppet-modules"
alias pm="cd $MC/product/mailchimp"

alias brewup='brew update && brew upgrade'
alias grep='grep --color=auto'
#alias hs='history 1 | grep'
alias k='kubectl'
alias ls='exa'
alias path="echo $PATH | tr : '\n'"
alias pip3="pip3 --isolated"
alias sed="gsed"
alias t2="tree -L 2"

alias tags='rg -e ":[a-z]*:" -o -N --no-filename $HOME/homewiki/log | sort | uniq -c'

alias gcm='git commit -m'
alias gd='git diff'
alias gst='git status'
alias grv='git remote -vv'
alias gcbm='git checkout -B master'
