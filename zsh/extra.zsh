#eval "$(rbenv init -)"
#eval "$(pyenv init -)"

source <(fzf --zsh)
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

if [[ "$OSTYPE" == "darwin"* ]]; then
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  if [[ $DOTPROFILE == intuit ]]; then
    source "$HOMEBREW_PREFIX/share/google-cloud-sdk/path.zsh.inc"
    source "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.zsh.inc"
  fi
fi
