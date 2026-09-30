# Local aliases
# --------------------------------------
alias ls="eza --long --time-style=long-iso --git --group-directories-first --header --links"
alias ll='ls -la'
alias tree='eza -T'
alias cat='bat'
alias c='clear'
alias g='git'

# Navigation aliases
# -----------------------------------
alias ~='cd ~'
alias ..='cd ..'
alias lms='cd ${HOME}/dev/didacte'

# Editor (always forward to Neovim!)
alias vi='nvim'
alias vim='nvim'

# TMUX
# -------------------------------------
alias tmat='tmux attach-session -t'
alias tma='tmux attach-session'
alias tml='tmux ls'
alias tmns='tmux new-session -s'
alias tmka='tmux kill-session -a'

# WORKMUX
alias wm='workmux'

# Random shortcut
# -------------------------------------
alias fk1="kill -KILL %1"

# Kill whatever is listening on a TCP port: killport 5013
# -------------------------------------
killport() {
  if [ -z "$1" ]; then
    echo "usage: killport <port>"
    return 1
  fi
  local pids
  pids=$(lsof -nP -tiTCP:"$1" -sTCP:LISTEN)
  if [ -z "$pids" ]; then
    echo "nothing listening on $1"
    return 0
  fi
  echo "killing $pids on $1"
  kill $pids && sleep 1
  lsof -nP -iTCP:"$1" -sTCP:LISTEN || echo "port $1 free"
}

# Kubernetes / Helm
# -------------------------------------
alias kcur='kubectl config current-context'

# Switch AKS context by env: kctx dev|stg|prod
kctx() {
  if [ -z "$1" ]; then
    echo "usage: kctx <dev|stg|prod>"
    return 1
  fi
  local ctx
  ctx=$(kubectl config get-contexts -o name | grep -m1 "itt-$1-containers-aks")
  if [ -z "$ctx" ]; then
    echo "no context matching itt-$1-containers-aks"
    return 1
  fi
  kubectl config use-context "$ctx"
}

# Helm release status in core: hst sg-backup-api
hst() { helm status "$1" -n core; }

# Helm releases in core, optional filter: hls backup
hls() { helm list -n core --all | grep -i "${1:-.}"; }
