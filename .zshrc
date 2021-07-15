# zsh options
setopt NO_CASE_GLOB
bindkey -v

autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# The following lines were added by compinstall

zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/Users/bryalee/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall
autoload bashcompinit && bashcompinit
export PROMPT='%(?..%F{red}!%? )%B%F{blue}%~%b%f %# '

source ~/.bash_aliases

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set vim as default editor
export EDITOR="vi"

# Load z
. ~/setup/z/z.sh

# Add setup bin to path
export PATH="$HOME/setup/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# colorized ls
alias ls='ls -G'

[[ -e ~/.zshrc_local ]] && source ~/.zshrc_local
