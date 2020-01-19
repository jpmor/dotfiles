#!/usr/bin/env zsh

# directory jumps
alias dot="cd $DOT"
alias hw="cd $HOME/homewiki"
alias sw="cd $HOME/side/site"
alias mc="cd $MC"
alias mcgo="cd $MCGO"
alias op="cd $MC/ops/puppet-modules"
alias pm="cd $MC/product/mailchimp"
alias rsg="cd $MC/rsg/"

# adjustments
alias ls='exa'
alias jq="jq -r" # why is this not the default???
alias grep='grep --color=auto'
alias pip3="pip3 --isolated"
alias sed="gsed"

# useful
alias brewup='brew update && brew upgrade'
alias path="echo $PATH | tr : '\n'"
alias t2="tree -L 2"
alias tags='rg -e ":[a-z]*:" -o -N --no-filename $HOME/homewiki/log | sort | uniq -c'

# shortcuts
alias k='kubectl'
alias gcm='git commit -m'
alias gd='git diff'
alias gst='git status'
alias grv='git remote -vv'
alias gcb='git checkout -B'
