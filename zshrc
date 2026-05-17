# ------------------------
# ZSH OPTIONS & HISTORY
# ------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt inc_append_history

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
# ZSH PLUGINS (Auto-suggestions & Syntax Highlighting)
# ------------------------
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ------------------------
# STARSHIP PROMPT
# ------------------------
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
