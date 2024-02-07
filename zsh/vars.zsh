export LANG="en_US.UTF-8"

export EDITOR="vim"
export VISUAL="vim"
export LESS_TERMCAP_md=$'\e[1;32m'

export DOT="$HOME/.dot"
export SITE="https://jpmor.com"
export HW="$HOME/homewiki"
export MC="/Volumes/CaseSensitive/mc"
export IMC="/Volumes/CaseSensitive/imc"
export GITHUB_HOST="git.rsglab.com"
export MCGO="$MC/go/src/$GITHUB_HOST"
export KUBECONFIG="$HOME/.config/iksm/combo"

export RBENV_ROOT="$HOME/.rbenv"
export GOPATH="$HOME/side/go"
export FZF_BASE="/usr/local/bin/fzf"
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
export PRAGMA="pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key"

# Why is this a Cask?
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export DISABLE_UNTRACKED_FILES_DIRTY="true"

path=(
  $RBENV_ROOT/bin
  $GOPATH/bin
  $HOME/.cargo/bin
  $DOT/bin
  /usr/local/bin # needed for docker
  $path
)

# Setup brew vars, including adding brew bin to path
if [ -f /opt/homebrew/bin/brew ]; then
  eval $(/opt/homebrew/bin/brew shellenv) # apple silicon
elif [ -f /usr/local/bin/brew ]; then
  eval $(/usr/local/bin/brew shellenv)
fi

# For arrays, keep only the first occurrence of each duplicated value.
typeset -U path
