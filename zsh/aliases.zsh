# generally, single quotes are better for aliases

# directory jumps
alias dot='cd $DOT'
alias hw='cd $HW'
alias hr='cd $HOME/side/homerun'
alias sw='cd $HOME/side/site'
alias mc='cd $MC'
alias ma='cd $MC/product/mailchimp'
alias md='cd $IMC/mailchimp-monolith/mailchimp-app-deployment'
alias imc='cd $IMC'
alias ia='cd $IMC/mailchimp-cloud/http-interposer'
alias id='cd $IMC/mailchimp-cloud/http-interposer-deployment'
alias mcgo='cd $MCGO'
alias op='cd $MC/ops/pantropy'
alias opm='cd $MC/ops/puppet-modules'
alias rsg='cd $MC/rsg/'

# adjustments
alias ls=eza
alias jq='jq -r' # why is this not the default???
alias grep='grep --color=auto'
alias pip3='pip3 --isolated'
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias sed='gsed'
  alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport'
fi

# useful
alias ...='../..'
alias -- -='cd -'
alias brewup='brew update; brew upgrade'
alias getpath='echo $PATH | tr : "\n"'
alias t2='tree -L 2'

# hw
alias wt="$HW/script/wikitree.py"
alias today='vim $(find $HW/log/*$(date +-%m-%d).md)'

# shortcuts
alias k='kubectl'
alias gcm='git commit -m'
alias gd='git diff'
alias gst='git status'
alias grv='git remote -vv'
alias gcb='git checkout -B'
alias glg='git log --all --graph --pretty=format:"%C(yellow)%h%C(auto)%d%C(white) %s %C(dim bold cyan)%ch"'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
