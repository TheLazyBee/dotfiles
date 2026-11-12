# dotfiles

My Arch Linux configuration, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## How it works

Each app is a folder (a Stow "package") that mirrors the home directory, for example `nvim/.config/nvim`. `stow` links these folders into `~/.config`, so the files in this repo are the real configs.

**Packages:** `eza` `ghostty` `hypr` `lazygit` `nmrs` `nvim` `rofi` `tmux` `waybar` `yazi` `zsh`

## Restore on a fresh Arch install

Follow the steps in order.

### 1. Install the tools

```bash
sudo pacman -S --needed git stow github-cli
```

### 2. Log in and clone

The repo is private, so a plain `git clone` will not work.

```bash
gh auth login
gh repo clone <your-username>/dotfiles ~/dotfiles
```

### 3. Install apps (optional)

Needs `yay` installed first for the AUR line.

```bash
sudo pacman -S --needed - < ~/dotfiles/pkglist.txt
yay -S --needed - < ~/dotfiles/aur-pkglist.txt
```

### 4. Stow the configs

> **Do this before opening any of the apps.** An app that starts first creates a default config, and Stow then reports a conflict.

```bash
cd ~/dotfiles
stow -nv eza ghostty hypr lazygit nmrs nvim rofi tmux waybar yazi zsh   # dry run
stow -v  eza ghostty hypr lazygit nmrs nvim rofi tmux waybar yazi zsh
```

If Stow reports a conflict, delete the default folder it names in `~/.config` and run the command again.

### 5. System zsh setting

`ZDOTDIR` is set in `/etc/zsh/zshenv`, which is outside the home folder, so Stow cannot manage it. It tells zsh to read `~/.config/zsh`.

```bash
cat /etc/zsh/zshenv   # check first, so nothing is lost
sudo mkdir -p /etc/zsh
sudo cp ~/dotfiles/etc-zsh-zshenv.reference /etc/zsh/zshenv
```

### 6. tmux plugins

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Then open tmux and press the prefix key + `I` to install the plugins.

### 7. Not in git, redo by hand

- nvm itself (install script). The block that loads it is already in `local.zsh`.
- App logins and a new SSH key for this machine.

## Notes

- The first zsh start downloads zinit and its plugins (needs internet), so it is slow once.
- History, caches and plugin downloads live outside this repo on purpose.

## Adding a new app

```bash
cd ~/dotfiles
mkdir -p APP/.config
mv ~/.config/APP APP/.config/APP
stow -nv APP && stow -v APP
```

Check the folder for tokens or passwords first, then add `APP` to the stow line in step 4 and commit.
