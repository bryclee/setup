# Installation

```
wget https://raw.githubusercontent.com/bryclee/setup/master/new_setup.sh
bash new_setup.sh
```

## Setting up screen

Screen depends on a startup script that isn't running (for some reason, see https://github.com/dnschneid/crouton/issues/115 for details). To fix this. To fix, add the following line to `/etc/rc.local`, which is run as root when first entering the chroot:

```
/etc/init.d/screen-cleanup start
```

## TMUX

Plugin manager [tpm](https://github.com/tmux-plugins/tpm). Press `<tmux prefix> + I` to install the plugins when tmux is running.

## Vim setup

### Colors

Colors forked from [vim-dim](https://github.com/jeffkreeftmeijer/vim-dim). Only use 16 colors for better flexibility when using this configuration on different machines.

### COC for completion

Some prerequisites that are not yet automated/other issues:
 - yarn needs to be installed globally
 - for vim, need vim-node-rpc installed
 - install the server extensions globally? if you use different versions of npm, you lose your extensions
 - only activate completion/bindings on files that have an extension installed?

