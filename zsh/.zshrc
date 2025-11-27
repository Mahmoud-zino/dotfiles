# Starship prompt
eval "$(starship init zsh)"

# fzf - Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --color=fg:#e0e0e0,bg:#1a1a2e,hl:#bb86fc,fg+:#e0e0e0,bg+:#16213e,hl+:#bb86fc,border:#bb86fc,prompt:#bb86fc,pointer:#9d4edd'

# zoxide - Smart cd
eval "$(zoxide init zsh)"

# Aliases
alias vim='nvim'
alias ls='ls --color=auto'
alias ll='ls -lah'
alias cat='bat'
alias cd='z'  # Use zoxide instead of cd
alias lg='lazygit'
alias top='btop'

# Add local bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
eval "$(zoxide init zsh)"
# Bitwarden aliases
alias bwu='export BW_SESSION=$(bw unlock --raw)'
alias bwls='bw list items | jq -r ".[].name" | sort'
alias bwsearch='bw list items --search'
alias bwget='bw get item'
alias bwpass='bw get password'
alias bwuser='bw get username'

# Pretty print search results
bwfind() {
  bw list items --search "$1" | jq -r '.[] | "[\(.name)]\n  User: \(.login.username // "N/A")\n  URL:  \(.login.uris[0].uri // "N/A")\n"'
}
# Update password in Bitwarden
bwupdate() {
  if [ -z "$1" ]; then
    echo "Usage: bwupdate <item-name>"
    return 1
  fi
  
  local item_id=$(bw get item "$1" | jq -r '.id')
  local temp_file=$(mktemp)
  
  bw get item "$1" > "$temp_file"
  nvim "$temp_file"
  
  cat "$temp_file" | bw encode | bw edit item "$item_id"
  rm "$temp_file"
  
  bw sync
  echo "Password updated for: $1"
}
