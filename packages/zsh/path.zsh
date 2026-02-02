# path.zsh - PATH configuration
# Loaded early to ensure paths are available for other modules

# Homebrew (Apple Silicon)
if [[ -d "/opt/homebrew/bin" ]]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi

# User binaries
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"

# Clawd scripts
[[ -d "$HOME/clawd/scripts" ]] && export PATH="$HOME/clawd/scripts:$PATH"

# Go
if [[ -d "$HOME/go" ]]; then
  export GOPATH="$HOME/go"
  export PATH="$GOPATH/bin:$PATH"
fi

# Rust/Cargo
[[ -d "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"

# pnpm
if [[ -d "$HOME/Library/pnpm" ]]; then
  export PNPM_HOME="$HOME/Library/pnpm"
  export PATH="$PNPM_HOME:$PATH"
fi

# bun
[[ -d "$HOME/.bun/bin" ]] && export PATH="$HOME/.bun/bin:$PATH"

# mise shims (before mise activate, needed for p10k instant prompt)
[[ -d "$HOME/.local/share/mise/shims" ]] && export PATH="$HOME/.local/share/mise/shims:$PATH"

# Environment variables
export GITHUB_USERNAME="lvnilesh"
export EDITOR=vi
export KUBE_EDITOR="code -w"
export GPG_TTY=$(tty)
export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt
