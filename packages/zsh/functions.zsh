# functions.zsh - Shell functions

# Create directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Extract various archive formats
extract() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.tar.xz)  tar xJf "$1" ;;
      *.bz2)     bunzip2 "$1" ;;
      *.rar)     unrar x "$1" ;;
      *.gz)      gunzip "$1" ;;
      *.tar)     tar xf "$1" ;;
      *.tbz2)    tar xjf "$1" ;;
      *.tgz)     tar xzf "$1" ;;
      *.zip)     unzip "$1" ;;
      *.Z)       uncompress "$1" ;;
      *.7z)      7z x "$1" ;;
      *)         echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Quick find file by name
ff() {
  find . -type f -iname "*$1*" 2>/dev/null
}

# Quick find directory by name
fd() {
  find . -type d -iname "*$1*" 2>/dev/null
}

# Show top 10 most used commands
topcmd() {
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10
}

# Get local IP address
localip() {
  ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null
}

# Get public IP address
publicip() {
  curl -s https://ipinfo.io/ip
}

# Simple HTTP server in current directory
serve() {
  local port="${1:-8000}"
  python3 -m http.server "$port"
}

# Open current directory in Finder
o() {
  open "${1:-.}"
}

# Weather in terminal
weather() {
  curl -s "wttr.in/${1:-}"
}

# Quick notes
note() {
  local notes_file="$HOME/.notes"
  if [[ -z "$1" ]]; then
    [[ -f "$notes_file" ]] && cat "$notes_file"
  else
    echo "$(date '+%Y-%m-%d %H:%M'): $*" >> "$notes_file"
  fi
}
