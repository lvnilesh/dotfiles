# lazy.zsh - Lazy loading for slow initializations

# Lazy load conda
# Only initialize when conda command is first used
if [[ -d "$HOME/miniconda3" ]] || [[ -d "$HOME/anaconda3" ]]; then
  conda() {
    unfunction conda
    local conda_path
    if [[ -d "$HOME/miniconda3" ]]; then
      conda_path="$HOME/miniconda3"
    else
      conda_path="$HOME/anaconda3"
    fi
    
    __conda_setup="$("$conda_path/bin/conda" 'shell.zsh' 'hook' 2>/dev/null)"
    if [[ $? -eq 0 ]]; then
      eval "$__conda_setup"
    else
      [[ -f "$conda_path/etc/profile.d/conda.sh" ]] && source "$conda_path/etc/profile.d/conda.sh"
    fi
    unset __conda_setup
    conda "$@"
  }
fi

# Lazy load kubectl completion (if kubectl is installed)
if command -v kubectl &>/dev/null; then
  kubectl() {
    unfunction kubectl
    source <(command kubectl completion zsh)
    command kubectl "$@"
  }
fi
