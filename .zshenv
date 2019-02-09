export EDITOR="vim"
export SITE="https://jpmor.net"

export MC="/Volumes/CaseSensitive/mc"
export GOPATH="/Volumes/CaseSensitive/mc/go"
export FZF_BASE="/usr/local/bin/fzf"
export DOT="/Users/jmoriarty/side/dotfiles"

export GITHUB_HOST="git.rsglab.com"
export LESS_TERMCAP_md="$(tput bold; tput setaf 6)"

export RBENV_ROOT="$HOME/.rbenv"

export PATH="$RBENV_ROOT/bin:$GOPATH/bin:$PATH"

setopt rmstarsilent
typeset -U PATH

# args: org, repo
setup() {
  origin_ssh_url=git@git.rsglab.com:$USER/$2.git; \
  upstream_ssh_url=git@git.rsglab.com:$1/$2.git; \
  mkdir -p $MC/$1; \
  git clone $origin_ssh_url $MC/$1/$2; \
  git -C $MC/$1/$2 remote add upstream $upstream_ssh_url; \
  echo
  echo "******** REMOTES: ********"; \
  git -C $MC/$1/$2 remote -vv; \
  echo "**************************"; \
  echo
  echo "Setup Complete!!"; \
}
