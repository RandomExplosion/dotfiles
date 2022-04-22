# Dotfiles
These are the dotfiles I use for my linux installs

## Packages
- WM: i3-gaps
- Bar: polybar
- Terminal Emulator: alacritty
- Shell: zsh (+oh my zsh)
- Shell Theme: powerlevel10k
- Theming: pywal
- Notes: Obsidian

## Installation
BOTH OF THESE OPTIONS WILL OVERWRITE ANY CURRENT CONFIG WITH THE SAME FILENAMES!

### Option 1 - Copy to ~/.config
As usual you can just copy everything into `~/.config`
```
git clone https://github.com/RandomExplosion/dotfiles
cp -r dotfiles/* ~/.config
```

### Option 2 - Symlinks
For the sake of easy maintinence I have all my dotfiles in a separate folder (this repo) and symlink them all into `.config` and other places as need be. If you want to do this follow the below instructions:

```
git clone https://github.com/RandomExplosion/dotfiles
cd dotfiles
chmod +x init-dotfiles.sh
./init-dotfiles.sh ~/.config
```
