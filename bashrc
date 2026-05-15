# ------------------------
# LOAD SYSTEM DEFAULTS
# ------------------------
if [ -f /etc/bash.bashrc ]; then
  . /etc/bash.bashrc
fi



# ------------------------
# BANNER / FETCH
# ------------------------
clear

if command -v fastfetch >/dev/null 2>&1; then
  fastfetch
else
  # Fallback minimal dynamic status line if fastfetch is not installed
  echo -e "  \e[1;34m󰚀\e[0m system_online \e[1;37m|\e[0m \e[1;32m󰄭\e[0m \e[1;32m$USER\e[0m\e[1;30m@\e[0m\e[1;32m$HOSTNAME\e[0m"
  echo ""
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
alias ls='ls --color=always'
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
