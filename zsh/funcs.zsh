#!/usr/bin/env zsh

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
