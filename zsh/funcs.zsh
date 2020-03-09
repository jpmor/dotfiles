#!/usr/bin/env zsh

# automatically clones and sets up repos for MC
# args: org, repo
setup() {
  ghe_api_url="https://git.rsglab.com/api/v3/repos/$1/$2/forks"
  curl -o /dev/null -su "$USER:$(cat ~/.ghe)" -X POST $ghe_api_url # make a fork
  sleep 10 # wait cuz forking is async

  origin_url=git@git.rsglab.com:$USER/$2.git
  mkdir -p $MC/$1
  git clone $origin_url $MC/$1/$2; # clone fork as origin

  upstream_url=git@git.rsglab.com:$1/$2.git
  git -C $MC/$1/$2 remote add upstream $upstream_url # add upstream as upstream
  echo
  echo "******** REMOTES: ********"
  git -C $MC/$1/$2 remote -vv
  echo "**************************"
  echo
  echo "Setup Complete!!"
}

# pulls in updates for all my MC repos
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

# fuzzy find phrases and then open that line in vim
hit() {
  y=$(rg -e "$1" --vimgrep -g '!node_modules*' $2 | fzf -0 | sed 's/:/ +/' | cut -d ":" -f1)
  if [ ! -z "$y" ]; then
    vim $(echo $y)  -c 'normal zz'
  fi
}

# read through notes by category
tag() {
  y=$(rg -e ":$1:" --sortr=path --vimgrep $2 $HOME/homewiki/log | sed 's/:/#/3' | fzf -0 -d \# --with-nth 2 | sed 's/:/ +/' | cut -d ":" -f1)
  if [ ! -z "$y" ]; then
    vim $(echo $y)  -c 'normal zz'
  fi
}

# open a user's MCA page
p() {
  open "https://us1.admin.mailchimp.com/peaches2/tools/user-search/direct-search?search-input=$1"
}

# show 5 most recent bugsnags to hit the MC project
newbugs() {
  curl -s -H "X-Bugsnag-API: true" -H "X-Version: 2" -H "Authorization: token $(cat ~/.bstoken)" "https://api.bugsnag.com/projects/5d40577f2103c00011aa3a7f/errors?&sort=first_seen&direction=desc" | jq '.[0:5][]|{first_seen: .first_seen, context: .context, message: .message, users: .users, id: .id}'
}

# ssh to whatever host a vip is on
vipssh() {
  vip="$1"
  host=$(dcm vips list | grep $vip | awk '{ print $1; }' | sed 's/\([a-z0-9]*\)-\([a-z0-9]*\)-.*/\1.\2.rsglab.com/g')

  for i in {1..2}; do
    sfthost="db$i-$host"
    echo $sfthost
    vips=$(ssh $sfthost 'hostname -I')
    echo $vips
    if test "${vips#*$vip}" != "$vips"
    then
      current_host=$sfthost
      break
    fi
  done

  ssh $current_host
}

# build login sessions on every shard
mcurl() {
  seq 1 20 | parallel \
    'shardkey="$(jq -r .us{} $HOME/.howler.json)"
    shardcookie="$HOME/.cookies/us{}"
    curl -sk -X POST "https://us{}.admin.mailchimp.com/login/post/" -d  $shardkey -c $shardcookie'
}

# update monolith ctags
updateCtags() {
  ctags -a -o .git/tags --options ~/.ctags.cnf .
}

openbugs() {
  open "https://app.bugsnag.com/mailchimp-2/mailchimp-1/errors?$(cat $MC/product/mailchimp/.github/CODEOWNERS | grep mone | sed -e 's/ .*//g' -e 's/^\///g' -e 's/\//%2F/g' | awk '{print "&filters[event.file]["NR-1"][type]=eq&filters[event.file]["NR-1"][value]=" $0}' | tr -d '\n')"
}
