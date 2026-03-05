#eval "$(rbenv init -)"
#eval "$(pyenv init -)"

source <(fzf --zsh)

if [[ "$OSTYPE" == "darwin"* ]]; then
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  source "$HOMEBREW_PREFIX/share/google-cloud-sdk/path.zsh.inc"
  source "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.zsh.inc"
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi
