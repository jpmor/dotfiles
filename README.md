# dotfiles

Config for zsh and vim, plus bootstrap scripts for a new machine.

## Setup

```sh
git clone https://github.com/jpmor/dotfiles ~/.dot
~/.dot/script/symlink   # create symlinks in ~/
~/.dot/script/macos     # apply macOS defaults
```

Then install packages: `brew bundle --file ~/.dot/etc/Brewfile`

## Structure

```
zsh/        shell config (zshenv, zshrc, aliases, funcs, vars, extra)
vim/        vimrc and vim/
etc/        gitconfig, gitconfig.intuit, Brewfile, aspell, ctags
script/     symlink, macos
```

## DOTPROFILE

The `DOTPROFILE` env var (set in `zshenv` based on `$USER`) gates work vs personal config throughout:

```
intuit    – work laptop (jmoriarty); enables intuit aliases, k8s funcs, gcloud, etc.
personal  – personal machines; enables wiki aliases, side project vars, etc.
```

## Notes

- `gitconfig.intuit` is included via `includeIf` for repos under `/Volumes/CaseSensitive/imc/`
- vim plugins managed by [vim-plug](https://github.com/junegunn/vim-plug); run `:PlugInstall` on first use
