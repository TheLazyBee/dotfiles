ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME ]]; then
  mkdir -p "${ZINIT_HOME:h}"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "$ZINIT_HOME/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k
[[ -f $ZSH_CONF/.p10k.zsh ]] && source "$ZSH_CONF/.p10k.zsh"

zinit ice blockf; zinit light zsh-users/zsh-completions

zinit snippet OMZL::git.zsh
# zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
# zinit snippet OMZP::aws
# zinit snippet OMZP::kubectl


autoload -Uz compinit && compinit -d "$ZSH_CACHE_DIR/zcompdump"
zinit cdreplay -q

zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
