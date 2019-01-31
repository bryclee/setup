# Installation

```
curl -o https://raw.githubusercontent.com/bryclee/setup/master/new_setup.sh | bash
```

## Setting up screen
Screen depends on a startup script that isn't running (for some reason, see https://github.com/dnschneid/crouton/issues/115 for details). To fix this. To fix, add the following line to `/etc/rc.local`, which is run as root when first entering the chroot:
```
/etc/init.d/screen-cleanup start
```

## TMUX
Currently using [tpm](https://github.com/tmux-plugins/tpm). Haven't looked in to it much, but the basics are to press `<tmux prefix> + I` to install the plugins when tmux is running.

## Vim setup

### COC for completion
Some prerequisites that are not yet automated/other issues:
 - yarn needs to be installed globally
 - for vim, need vim-node-rpc installed
 - install the server exetnsions globally?
 - only activate completion/bindings on files that have an extension installed?
 - there seems to be something cause a bunch of redraws? screen flashes sometimes for new buffers


## Other things that are nice to have that are not installed as part of the script

### General

Flux

### Mac

XCode App - The command line tools are installed as part of the script, but not sure if that includes all the tools that are desired.
Alfred (search is better than default Spotlight)
    - Script will install, but need to manually disable the spotlight shortcut in system preferences
Spectacle
