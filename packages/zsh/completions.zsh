# completions.zsh - Zsh completion configuration

# Initialize completion system
autoload -Uz compinit

# Only regenerate .zcompdump once per day
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Completion options
setopt COMPLETE_IN_WORD    # Complete from both ends of a word
setopt ALWAYS_TO_END       # Move cursor to end after completion
setopt AUTO_MENU           # Show completion menu on successive tab
setopt AUTO_LIST           # Automatically list choices on ambiguous completion
setopt AUTO_PARAM_SLASH    # Add trailing slash for directories
setopt EXTENDED_GLOB       # Needed for file modification glob modifiers
unsetopt MENU_COMPLETE     # Don't autoselect first completion entry

# Completion styling
zstyle ':completion:*' menu select                           # Enable menu selection
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # Case insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"     # Use LS_COLORS
zstyle ':completion:*' verbose yes                           # Verbose completion
zstyle ':completion:*:descriptions' format '%B%d%b'         # Bold descriptions
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''                         # Group by category

# Cache completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zsh/cache"

# Homebrew completions
if [[ -d "/opt/homebrew/share/zsh/site-functions" ]]; then
  FPATH="/opt/homebrew/share/zsh/site-functions:$FPATH"
fi
