typeset -U path
path=("$HOME/.local/bin" "$HOME/go/bin" $path)

export EDITOR=nvim
export VISUAL=nvim

export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
export ZSH_STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/zsh"
[[ -d $ZSH_CACHE_DIR ]] || mkdir -p "$ZSH_CACHE_DIR"
[[ -d $ZSH_STATE_DIR ]] || mkdir -p "$ZSH_STATE_DIR"
