# ls -> eza (falls back to plain ls)
if (( $+commands[eza] )); then
  alias ls='eza --icons=auto --group-directories-first'
  alias ll='eza -lh --icons=auto --group-directories-first --git'
  alias la='eza -lah --icons=auto --group-directories-first --git'
  alias lt='eza --tree --level=2 --icons=auto'
else
  alias ls='ls --color=auto'
  alias ll='ls -lh'
  alias la='ls -lAh'
fi

# cat -> bat
(( $+commands[bat] )) && alias cat='bat'

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# safer file operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
alias mkdir='mkdir -p'

# readable output
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias ip='ip -color=auto'

# shortcuts
alias vim='nvim'
alias v='nvim'
alias lg='lazygit'
alias c='clear'
alias reload='exec zsh'
alias path='print -l $path'

# suffix aliases
alias -s md='bat'
alias -s yaml='bat'
alias -s json='bat'
alias -s {png,jpg,mp4,mov}='xdg-open'
alias -s {go,js,ts}="$EDITOR"

# Tmux aliases
alias t='tmux'
alias ta='tmux attach'
alias td='tmux detach'
