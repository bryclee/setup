# zsh options
setopt NO_CASE_GLOB
bindkey -v

# Ghostty only auto-loads its shell integration (which drives the vi-mode
# cursor shape, among other things) in shells it spawns directly -- not in
# `tmux`/`exec zsh`/nested shells -- so source it explicitly here too.
# https://ghostty.org/docs/features/shell-integration
if [[ -n "$GHOSTTY_RESOURCES_DIR" ]]; then
  source "$GHOSTTY_RESOURCES_DIR"/shell-integration/zsh/ghostty-integration
fi

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

# Reduce delay after Esc before zsh registers a vi-mode switch (default 40 = 0.4s)
export KEYTIMEOUT=20

# Show [+]/[-] in the prompt for vi insert/normal mode (normal mode dimmed)
function zle-keymap-select zle-line-init {
  if [[ $KEYMAP == vicmd ]]; then
    VI_MODE_INDICATOR=$'%{\e[2m%}[-]%{\e[22m%} '
  else
    VI_MODE_INDICATOR="[+] "
  fi
  zle reset-prompt
}
zle -N zle-keymap-select
zle -N zle-line-init

setopt PROMPT_SUBST
export PROMPT='%(?..%F{red}!%? )%(1j.%F{yellow}⚙%j %f.)%B%F{blue}%~%b%f ${VI_MODE_INDICATOR}%# '

[[ -f "/opt/homebrew/bin/brew" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Add setup bin to path
export PATH="$HOME/setup/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# colorized ls
alias ls='ls -G'

# shortcuts to quicly access files
bindkey -s ^f "tmux-s\n"
bindkey -s ^o ". cdproject\n"

# Add fzf keybinds if fzf is installed
hash fzf 2</dev/null && source <(fzf --zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/setup/fzf-git.sh/fzf-git.sh ] && source ~/setup/fzf-git.sh/fzf-git.sh

# Set vim as default editor
export EDITOR="vi"

[[ -e ~/.zshrc_local ]] && source ~/.zshrc_local
source ~/.bash_aliases

