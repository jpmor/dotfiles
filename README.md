
# dotfiles

I try to keep any important dotfiles and configs committed in this repo.
* It's useful to have a history.
* This way they are backed up.
* Makes it easy to share configs across machines.

Most of the configs relate to `zsh` (preferred shell) and `vim` (preferred editor).

## How does this work?

1. This repo is cloned as `~/.dot`
2. `script/symlink` creates symlinks that point to files in `~/.dot`
