## Setting up screen
Screen depends on a startup script that isn't running (for some reason, see https://github.com/dnschneid/crouton/issues/115 for details). To fix this. To fix, add the following line to `/etc/rc.local`, which is run as root when first entering the chroot:
```
/etc/init.d/screen-cleanup start
```

## Set up vim
- Install pathogen https://github.com/tpope/vim-pathogen
- Useful packages
  - [FZF](https://github.com/junegunn/fzf)
    - Install with `git clone --depth 1 https://github.com/junegunn/fzf.git ~/.vim/bundle/fzf` (Install here if using with pathogen)
  - [vim-airline](https://github.com/junegunn/fzf)
- Add `~/.vimrc`
