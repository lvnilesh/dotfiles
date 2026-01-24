# plugins.zsh - Oh-My-Zsh and plugins configuration

# Oh-My-Zsh setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Oh-My-Zsh plugins
plugins=(
  git
  kubectl
  docker
  docker-compose
  macos
  npm
  zsh-autosuggestions
  zsh-syntax-highlighting
)

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/highlighters
export ZSH_DISABLE_COMPFIX=true

# Load Oh-My-Zsh
[[ -s "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# Load Powerlevel10k config
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# fzf key bindings and completion
if [[ -f "$HOME/.fzf.zsh" ]]; then
  source "$HOME/.fzf.zsh"
elif command -v fzf &>/dev/null; then
  eval "$(fzf --zsh 2>/dev/null)"
fi

# autojump - provides 'j' shortcut for quick directory navigation
if [[ -f "/opt/homebrew/etc/profile.d/autojump.sh" ]]; then
  source "/opt/homebrew/etc/profile.d/autojump.sh"
elif [[ -f "/usr/local/etc/profile.d/autojump.sh" ]]; then
  source "/usr/local/etc/profile.d/autojump.sh"
fi
