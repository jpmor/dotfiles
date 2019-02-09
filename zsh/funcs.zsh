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

gitsync() {
  find "$MC" -d 2 -type d \
    ! -path "*/go/*" \
    ! -path "*/tmp/*" \
    ! -path "*/.git/*" | while read -r repo
  do
    if [ -z "$(git -C "$repo" diff upstream/master)" ]
    then
      git -C "$repo" pull --quiet upstream master
      git -C "$repo" push --quiet origin master
      echo "✅ $repo is clean"
    else
      echo "❗️ $repo is dirty"
    fi
    echo
  done
}

