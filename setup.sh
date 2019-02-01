#!/bin/bash
set -x

# Run the installation for the submodules
git submodule init
git submodule update

mkdir sources

# Run the install scripts for different items.
# Note that these are run from the setup dir.
(. ./install/misc.${OS}.sh)
(. ./install/node.sh)
(. ./install/vim.${OS}.sh)
(. ./install/fzf.${OS}.sh)
(. ./install/tmux.${OS}.sh)

# Run the link script to link vim and other rc files
. ./link.sh

# Install vim plugins with vim-plug and then quit
vi +PlugInstall +qall

set +x
