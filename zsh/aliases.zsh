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
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias sed="gsed"
  alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"
fi

# useful
alias ...='../..'
alias -- -='cd -'
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
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
