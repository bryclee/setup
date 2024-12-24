# Mac utils

Brew packages installed

```sh
$ brew list --installed-on-request | xargs brew desc --eval-all
bat: Clone of cat(1) with syntax highlighting and Git integration
borders: A window border system for macOS (https://github.com/FelixKratz/JankyBorders)
fzf: Command-line fuzzy finder written in Go
gh: GitHub command-line tool
lazygit: Simple terminal UI for git commands
neovim: Ambitious Vim-fork focused on extensibility and agility
pandoc: Swiss-army knife of markup format conversion
pnpm: Fast, disk space efficient package manager
reattach-to-user-namespace: Reattach process (e.g., tmux) to background
ripgrep: Search tool like grep and The Silver Searcher
tmux: Terminal multiplexer
yarn: JavaScript package manager

$ brew ls --casks | xargs brew desc --eval-all
font-monaspace: (Monaspace) [no description] (https://github.com/githubnext/monaspace)
font-symbols-only-nerd-font: (Symbols Nerd Font (Symbols Only)) [no description]
aerospace: (AeroSpace) AeroSpace is an i3-like tiling window manager for macOS (https://github.com/nikitabobko/AeroSpace)
scroll-reverser: (Scroll Reverser) Tool to reverse the direction of scrolling (https://pilotmoon.com/scrollreverser/)
wezterm: (WezTerm) GPU-accelerated cross-platform terminal emulator and multiplexer (https://wezfurlong.org/wezterm/install/macos.html)
```
