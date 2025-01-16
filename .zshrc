# zsh options
setopt NO_CASE_GLOB
bindkey -v

autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey "^R" history-incremental-pattern-search-backward

# The following lines were added by compinstall

zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/Users/bryalee/.zshrc'

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

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
# Disabled because it sometimes make shell startup slow
# . ~/setup/z/z.sh

# Add setup bin to path
export PATH="$HOME/setup/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# colorized ls
alias ls='ls -G'
# export FZF_DEFAULT_OPTS="--bind alt-a:select-all,alt-d:deselect-all,ctrl-s:toggle-sort"

[[ -e ~/.zshrc_local ]] && source ~/.zshrc_local

# tmux-sessionizer https://github.com/ThePrimeagen/.dotfiles/blob/9990fea97c007d4c1f51481dd54cc74fcfc5e21d/zsh/.zsh_profile#L26
bindkey -s ^f "tmux-s\n"
bindkey -s ^o ". cdproject\n"

# Add fzf keybinds if fzf is installed
hash fzf 2</dev/null && source <(fzf --zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/setup/fzf-git.sh/fzf-git.sh ] && source ~/setup/fzf-git.sh/fzf-git.sh

