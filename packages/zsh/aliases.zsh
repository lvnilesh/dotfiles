# aliases.zsh - Shell aliases

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ls with colors (use eza if available, fallback to ls)
if command -v eza &>/dev/null; then
  alias ls='eza'
  alias ll='eza -la'
  alias la='eza -a'
  alias lt='eza --tree --level=2'
else
  alias ls='ls -G'
  alias ll='ls -la'
  alias la='ls -A'
fi

# Git shortcuts
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias glog='git log --oneline --graph --decorate -10'

# Safety nets
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Shortcuts
alias c='clear'
alias h='history'
alias jb='jobs -l'  # 'j' reserved for autojump
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%Y-%m-%d %H:%M:%S"'

# macOS specific
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# Homebrew update
alias update='brew update; brew upgrade; brew cleanup; brew doctor'

# Clean up LaunchServices to remove duplicates in the "Open With" menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# App shortcuts
alias st='open -a SourceTree'
alias obs='open -a Obsidian'
alias dkill="osascript -e 'quit app \"Docker\"'"
alias ckill="osascript -e 'quit app \"Visual Studio Code\"'"

# OpenClaw
alias oc='openclaw'
