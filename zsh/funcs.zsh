# automatically clones and sets up repos for MC
# args: org, repo
setup() {
  ghe_api_url="https://$GITHUB_HOST/api/v3/repos/$1/$2/forks"
  curl -o /dev/null -su "$USER:$(cat ~/.ghe)" -X POST $ghe_api_url # make a fork
  sleep 10 # wait cuz forking is async

  origin_url=git@$GITHUB_HOST:$USER/$2.git
  mkdir -p $MC/$1
  git clone $origin_url $MC/$1/$2; # clone fork as origin

  upstream_url=git@$GITHUB_HOST:$1/$2.git
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
  find "$MC" "$MCGO" "$IMC" -d 2 -maxdepth 2 -type d | parallel \
    'if [ ! -d {}/.git ]; then exit; fi
    head_branch=$(git -C {} remote show origin | sed -n "s/  HEAD branch: \(\w\)/\1/p")
    if [ -z "$(git -C {} diff origin/$head_branch)" ]
    then
      git -C "{}" pull --quiet origin $head_branch
      printf "✅ "
    else
      printf "❗️ "
    fi
    echo {} | sed -En "s/.*\/([a-z\-]*\/[a-z]*)/\1/p"'
}

gro() {
  git fetch origin
  git reset --hard "origin/$(git branch --show-current)"
}

# pull down PR on branch "tmp"
getpr() {
  git fetch --force origin pull/$1/head:tmp; git reset --hard tmp
}

# fuzzy find phrases and then open that line in vim
hit() {
  #match=$(rg --vimgrep $@ | fzf -0)
  mc_glob_exclusion="$(if [[ $PWD = $MC/product/mailchimp ]]; then print vendor/^rsg | sed 's/ /,/g' | tr -d '\n'; else print ''; fi)"

  match=$(rg --hidden --vimgrep -g '!{'"$mc_glob_exclusion"'}/**' -e $@ | fzf -0)

  if [ ! -z "$match" ]; then
    file=$(cut -d ':' -f1 <<< "$match")
    line=$(sed -r 's/.*:([0-9]+):[0-9]+:.*/\1/' <<< "$match")
    col=$(sed -r 's/.*:[0-9]+:([0-9]+):.*/\1/' <<< "$match")

    vim "+normal $line"'G'"$col|" "$file"
  fi
}

# read through notes by category
tag() {
  y=$(rg -e ":$1:" --sortr=path --vimgrep $2 $HW/log | sed 's/:/#/3' | fzf -0 -d \# --with-nth 2 | sed 's/:/ +/' | cut -d ":" -f1)
  if [ ! -z "$y" ]; then
    sh -c "vim $y -c 'normal zz'"
  fi
}

# prints a list of markdown hyper links to every instance of a tag
mdtag() {
  tags=$(rg -e ":$1:" $HW | grep -v ':outdated:' | grep -v ':done:' | sort -r | sed -e "s/^.*log\///g")

  last_reviewed=$(jq '.'"$1"' // ""' "$HW/review.json")

  echo "\n\`\`\`\nGenerated by: mdtag $1 TODO\n\`\`\`"
  while read tag;
  do
    date=$(echo $tag | awk -F '.md:' '{print $1}')
    line=$(echo $tag | awk -F '.md:' '{print $2}' | sed -e 's/\s[:a-z]\+$//g')
    if [[ $date > $last_reviewed ]]; then
      # use a different bullet for golden entries
      if [[ $tag == *":golden:"* ]]; then
        bullet="*"
      else
        bullet="-"
      fi
      echo "$bullet [$line](log/$date.md)"
    fi
  done <<< $tags
}

# open a user's MCA page
p() {
  open "https://us1.admin.mailchimp.com/peaches2/tools/user-search/direct-search?search-input=$1"
}

o() {
  open "https://admin.mailchimp.com/peaches2/tools/user-search/direct-search?search-type=order&search-input=$1"
}

# update monolith ctags
update_ctags() {
  ctags -a -o .git/tags --options=$HOME/.ctags.cnf .
}

# print most used commands
top_cmds() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

merges() {
  # Get all the merge commits that match the criteria.
  merge_shas=$(git --no-pager log --merges -m --first-parent --format=format:%H $@)

  if [ -z "$merge_shas" ]; then return 0; fi
  echo

  # Print useful info about each merge commit.
  while read sha;
  do
    # Print an overview of the commit.
    git --no-pager show --quiet --pretty="%C(red)%h %C(yellow)%ad %C(cyan)%an %n %C(magenta)%b %C(white)" $sha
    # Print the PR url (if it exists, we used to push directly).
    pr=$(git show --format=%B $sha | grep -ohE '#\d*')
    orgrepo=$(git remote get-url upstream | grep -oh '\w*\/\w*')
    if [[ $pr ]]; then
      echo " https://$GITHUB_HOST/$orgrepo/pull/${pr:1}\n"
    fi
    # Print the diff of the total merge.
    git --no-pager diff --stat $sha^ $sha;
    echo
  done <<< $merge_shas
}
