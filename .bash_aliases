# Bash aliases - executed from ~/.bashrc

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Git aliases
alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias gg="git graph"
alias gco="git checkout"
alias gpul="git pull"
alias gpush="git push"

# FZF setting -- allow symlinks
if [ -n "$(which rg)" ]; then
  # Set FZF default to use rg
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow .'
elif [ -n "$(which ag)" ]; then
  # Set FZF default to use ag
  export FZF_DEFAULT_COMMAND='ag -l --nocolor --hidden -g ""'
  # Default ag to follow symlinks
  alias ag='ag -f'
fi

export BAT_THEME="base16"
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --color=16 --bind ctrl-a:toggle-all"

# FZF aliases/functions
function fgb() {
  git branch --format='%(refname:short)' |
    fzf --reverse \
    --preview 'git graph --color=always {}' \
    --preview-window=down:50%
}

# Git log that outputs hash to stdout, for use in scripts.
# Unfortunately, I don't see a simple way to make this work with fgl-view() - both need to print to stdout.
function fgl() {
  git log --graph --color=always \
    --format="%C(auto)%h%d %s %C(black)%C(italic)%cr%Creset" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index \
    --preview='git show --color=always --pretty=medium $(echo {} | awk '"'"'{print $2}'"'"')' \
    --bind "ctrl-j:down,ctrl-k:up,ctrl-d:page-down,ctrl-u:page-up,J:preview-down,K:preview-up,D:preview-page-down,U:preview-page-up,ctrl-p:toggle-preview" |
    awk '{print $2}'
  }
# Git log browser from https://gist.github.com/junegunn/f4fca918e937e6bf5bad
fgl-view() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(italic)%cr%Creset" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}
function npmf() {
  local scripts=$(npm run --json | python -c 'import sys, json; print "\n".join(sorted(["\t".join(s) for s in json.load(sys.stdin).items()]))')
  local script=$(echo "$scripts" |
    column -t -s $'\t' |
    fzf --reverse --nth 1 |
    awk '{print $1}')

  if [[ -z "$script" ]]
  then
    return
  fi

  local selected="npm run $script"
  echo "$selected"
  history -s $selected
  npm run $script
}

# More git aliases composed
alias grb='git checkout $(fgb)'

# Combine z and fzf
function zf() {
  local entries=($(z | sort -n -r | grep "$1" | awk '{print $2}'))
  local target=$(printf "%s\n" "${entries[@]}" | fzf)

  [[ -n "$target" ]] && _z $target
}
