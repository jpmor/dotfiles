export LANG="en_US.UTF-8"

export EDITOR="vim"
export VISUAL="vim"
export LESS_TERMCAP_md=$'\e[1;32m'

export DOT="$HOME/.dot"
export MC="/Volumes/CaseSensitive/mc"
export GITHUB_HOST="git.rsglab.com"
export MCGO="$MC/go/src/$GITHUB_HOST"
export SITE="https://jpmor.net"

export RBENV_ROOT="$HOME/.rbenv"
export GOPATH="/Volumes/CaseSensitive/mc/go"
export FZF_BASE="/usr/local/bin/fzf"
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
export PRAGMA="pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key"
export CS_STANDARD="$MC/product/mailchimp/vendor/rsg/mc-codesniffer-ruleset/MCStandard"

# Why is this a Cask?
export GCP_GARBAGE="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"

export DISABLE_UNTRACKED_FILES_DIRTY="true"

PATH+=:$RBENV_ROOT/bin:$GOPATH/bin:$HOME/.cargo/bin:$DOT/bin:/usr/local/sbin:$GCP_GARBAGE/bin:
#typeset -U PATH
