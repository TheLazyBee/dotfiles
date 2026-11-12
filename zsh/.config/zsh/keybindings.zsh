bindkey -e
zmodload zsh/terminfo

bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward
[[ -n ${terminfo[kcuu1]} ]] && bindkey "${terminfo[kcuu1]}" history-beginning-search-backward
[[ -n ${terminfo[kcud1]} ]] && bindkey "${terminfo[kcud1]}" history-beginning-search-forward


bindkey ' ' magic-space

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

copy-command() {
  if (( $+commands[wl-copy] )); then
    print -rn -- "$BUFFER" | wl-copy
  elif (( $+commands[xclip] )); then
    print -rn -- "$BUFFER" | xclip -selection clipboard
  else
    zle -M "install wl-clipboard or xclip"
    return 1
  fi
  zle -M "copied"
}
zle -N copy-command
bindkey '^xc' copy-command

zle_highlight+=(paste:none)
