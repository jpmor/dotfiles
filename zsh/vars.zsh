export LANG="en_US.UTF-8"

export EDITOR="vim"
export VISUAL="vim"
export LESS_TERMCAP_md=$'\e[1;32m'

export DOT="$HOME/.dot"
export SITE="https://jpmor.com"
export HW="$HOME/homewiki"

if [[ $DOTPROFILE == personal ]]; then
  export SIDE="$HOME/side"
fi
export MC="/Volumes/CaseSensitive/mc"
export IMC="/Volumes/CaseSensitive/imc"
export GITHUB_HOST="github.com"

if [[ $DOTPROFILE == intuit ]]; then
  export MA="$IMC/mailchimp-monolith/mailchimp"
  export TA="$IMC/mctx/mandrill-app"
  export TD="$IMC/mctx/mandrill-app-deployment"
  export TT="$IMC/mctx/mandrill-tests"
  export CS_STANDARD="$MA/vendor/rsg/mc-codesniffer-ruleset/MCStandard"
  export KUBECONFIG="$HOME/.kube/intuit_config"
  export GITHUB_HOST="github.intuit.com"
fi
export RBENV_ROOT="$HOME/.rbenv"
export GOPATH="$HOME/side/go"
export N_PREFIX="$HOME/.n"
export FZF_BASE="/usr/local/bin/fzf"
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
export PRAGMA="pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key"

# Why is this a Cask?
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export DISABLE_UNTRACKED_FILES_DIRTY="true"

path=(
  $HOME/.rd/bin        # rancher desktop
  $HOME/.local/bin     # pipx
  $N_PREFIX/bin        # node (n)
  $RBENV_ROOT/bin      # ruby (rbenv)
  $GOPATH/bin          # go
  $HOME/.cargo/bin     # rust (cargo)
  $DOT/bin             # dotfiles scripts
  /usr/local/bin       # docker
  $path
)

# Cache brew shellenv to avoid spawning a subprocess on every shell open (~50ms).
# Cache is invalidated when the brew binary itself changes (i.e. after brew upgrades).
if [ -f /opt/homebrew/bin/brew ]; then
  if [[ ! -f ~/.brew_env || /opt/homebrew/bin/brew -nt ~/.brew_env ]]; then
    /opt/homebrew/bin/brew shellenv > ~/.brew_env
  fi
  source ~/.brew_env
elif [ -f /usr/local/bin/brew ]; then
  if [[ ! -f ~/.brew_env || /usr/local/bin/brew -nt ~/.brew_env ]]; then
    /usr/local/bin/brew shellenv > ~/.brew_env
  fi
  source ~/.brew_env
fi

# zsh-completions (must be before compinit)
[[ "$OSTYPE" == "darwin"* ]] && FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

# For arrays, keep only the first occurrence of each duplicated value.
typeset -U path
