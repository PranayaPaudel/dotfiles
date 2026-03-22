# ------------------------
# LOAD SYSTEM DEFAULTS
# ------------------------
if [ -f /etc/bash.bashrc ]; then
  . /etc/bash.bashrc
fi



# ------------------------
# BANNER
# ------------------------
clear


echo -e "\e[1;35m"
cat << "EOF"
    ____  ____ __________  ____ ___  __  ___
   / __ \/ __ `/ ___/ __ \/ __ `/ / / / / _ \
  / /_/ / /_/ / /  / / / / /_/ / /_/ /  __/
 / .___/\__,_/_/  /_/ /_/\__,_/\__, /\___/ 
/_/                           /____/       
EOF
echo -e "\e[0m"

# Minimal status line
echo -e "  \e[1;34m󰚀\e[0m system_online \e[1;37m|\e[0m \e[1;32m󰄭\e[0m \e[1;32mparnaye\e[0m\e[1;30m@\e[0m\e[1;32mparnaye-GF65MSI\e[0m"
echo ""



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
