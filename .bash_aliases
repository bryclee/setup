# Bash aliases - executed from ~/.bashrc

# Git aliases
alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias gg="git graph"
alias gco="git checkout"
alias gpul="git pull"
alias gpush="git push"

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
function fnpm() {
  local scripts=$(npm run --json | python -c 'import sys, json; print "\n".join(sorted(["\t".join(s) for s in json.load(sys.stdin).items()]))')
  local script=$(echo "$scripts" |
    column -t -s $'\t' |
    fzf --reverse --nth 1 |
    awk '{print $1}')

  # TODO: Populate history list with command so pressing "up" will navigate to it
  [[ -n "$script" ]] && echo npm run $script && npm run $script
}

# More git aliases composed
alias grb='git checkout $(fgb)'

# Combine z and fzf
function zf() {
  local entries=($(z | sort -n -r | grep "$1" | awk '{print $2}'))
  local target=$(printf "%s\n" "${entries[@]}" | fzf)

  [[ -n "$target" ]] && _z $target
}

