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

hs() {
  if [ ! -z "$1" ]; then
    y=$(history 1 | grep $1 | fzf -0 --tac --layout=default --tiebreak=index | awk '{$1=$1};1' | cut -d " " -f 2-)
    if [ ! -z "$y" ]; then
      echo "\033[0;33m> $y\033[0m"
      echo ": $(date +"%s"):0;$y" >> $HISTFILE
      eval $y
    fi
  else
    history -25
  fi
}

hit() {
  y=$(rg -e "$1" --vimgrep -g '!node_modules*' $2 | fzf -0 | sed 's/:/ +/' | cut -d ":" -f1)
  if [ ! -z "$y" ]; then
    vim $(echo $y)  -c 'normal zz'
  fi
}

tag() {
  y=$(rg -e ":$1:" --sortr=path --vimgrep $2 $HOME/homewiki/log | sed 's/:/#/3' | fzf -0 -d \# --with-nth 2 | sed 's/:/ +/' | cut -d ":" -f1)
  if [ ! -z "$y" ]; then
    vim $(echo $y)  -c 'normal zz'
  fi
}
