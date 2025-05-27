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

# Random shortcut
# -------------------------------------
alias fk1="kill -KILL %1"
