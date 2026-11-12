# dotfiles (GNU Stow)

Restore on a fresh Arch install:
1. sudo pacman -S stow git
2. git clone <this repo> ~/dotfiles
3. cd ~/dotfiles && stow -v eza ghostty hypr lazygit nmrs nvim rofi tmux waybar yazi zsh
4. sudo mkdir -p /etc/zsh && sudo cp ~/dotfiles/etc-zsh-zshenv.reference /etc/zsh/zshenv
   (this sets ZDOTDIR so zsh reads ~/.config/zsh)
5. git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
   then open tmux and press prefix + I to install the plugins
