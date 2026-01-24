#!/bin/bash
# Display local IP address for tmux status bar

ip=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null)
if [[ -n "$ip" ]]; then
  echo "$ip"
else
  echo "no ip"
fi
