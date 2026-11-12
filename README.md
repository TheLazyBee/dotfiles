# dotfiles (GNU Stow)

Restore on a fresh Arch install, in this order:

1. Install the tools:
   sudo pacman -S --needed git stow github-cli

2. Log in and clone (the repo is private, so a plain git clone will not work):
   gh auth login
   gh repo clone TheLazyBee/dotfiles ~/dotfiles

3. Install apps (needs yay installed first for the AUR line):
   sudo pacman -S --needed - < ~/dotfiles/pkglist.txt
   yay -S --needed - < ~/dotfiles/aur-pkglist.txt

4. Stow the configs BEFORE opening any of the apps:
   cd ~/dotfiles
   stow -nv eza ghostty hypr lazygit nmrs nvim rofi tmux waybar yazi zsh
   stow -v  eza ghostty hypr lazygit nmrs nvim rofi tmux waybar yazi zsh
   If it reports a conflict, an app already created a default config:
   delete that default folder in ~/.config and run the command again.

5. System zsh setting (sets ZDOTDIR so zsh reads ~/.config/zsh):
   cat /etc/zsh/zshenv      # check first, so nothing is lost
   sudo mkdir -p /etc/zsh
   sudo cp ~/dotfiles/etc-zsh-zshenv.reference /etc/zsh/zshenv

6. tmux plugins:
   git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
   then open tmux and press prefix + I

7. Not in git, redo by hand:
   - nvm itself (install script; the block that loads it is already in local.zsh)
   - app logins and a new SSH key for this machine

Notes:
- The first zsh start downloads zinit and the plugins (needs internet), so it is slow once.
- When adding a new app, also add its name to the stow line in step 4.
