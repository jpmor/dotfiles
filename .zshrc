
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="custom"

DISABLE_UNTRACKED_FILES_DIRTY="true"


plugins=(
  git
  docker
  fzf
  kubectl
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

source ~/.aliases

# User configuration
eval "$(rbenv init -)"
#eval "$(pyenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
