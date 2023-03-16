if [ -e ~/.profile ]; then
    . ~/.profile
fi

if [ -e ~/.bash_profile_local ]; then
    . ~/.bash_profile_local
fi

if [ -e ~/.bashrc ]; then
    . ~/.bashrc
fi
