# env.zsh - Environment variables (non-PATH)

export GITHUB_USERNAME="lvnilesh"
export EDITOR=vi
export KUBE_EDITOR="code -w"
export GPG_TTY=$(tty)
export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt

# Bitwarden session from Keychain
export BW_SESSION=$(security find-generic-password -a "cloudgenius" -s "bw-session" -w 2>/dev/null)
