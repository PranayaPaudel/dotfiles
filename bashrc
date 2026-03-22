# ------------------------
# LOAD SYSTEM DEFAULTS
# ------------------------
if [ -f /etc/bash.bashrc ]; then
  . /etc/bash.bashrc
fi



# ------------------------
# BASIC SETTINGS
# ------------------------
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000



# ------------------------
# COLORS FOR LS
# ------------------------
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'



# ------------------------
# GIT SHORTCUTS
# ------------------------
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'



# ------------------------
# NAVIGATION
# ------------------------
alias ..='cd ..'
alias ...='cd ../..'



# ------------------------
# STARSHIP PROMPT
# ------------------------
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init bash)"
fi
