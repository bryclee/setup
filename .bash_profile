if [ -e ~/.profile ]; then
    . ~/.profile
fi

if [ -e ~/.bash_profile_local ]; then
    . ~/.bash_profile_local
fi

if [ -e ~/.bashrc ]; then
    . ~/.bashrc
fi

export NVM_DIR="/Users/bryalee/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

