#!/usr/bin/env zsh

# args: org, repo
# need to clone in GHE first
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

gitsync() {
  find "$MC" "$MCGO" -d 2 -maxdepth 2 -type d | parallel \
    'if [ ! -d {}/.git ]; then exit; fi
    if [ -z "$(git -C {} diff upstream/master)" ]
    then
      git -C "{}" pull --quiet upstream master
      git -C "{}" push --quiet origin master
      printf "✅ "
    else
      printf "❗️ "
    fi
    echo {} | sed -En "s/.*\/([a-z]*\/[a-z]*)/\1/p"'
}
