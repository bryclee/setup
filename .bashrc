if [ -f ~/.bash_aliases ]
then
    . ~/.bash_aliases
fi

if [ -f ~/.bashrc_local ]
then
    . ~/.bashrc_local
fi

# FZF setting -- allow symlinks
export FZF_DEFAULT_COMMAND="find -L * -path '*/\.*' -prune -o -type f -print -o -type l -print 2> /dev/null"

# Initialize z
. ~/setup/z/z.sh

