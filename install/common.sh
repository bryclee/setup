echo "Downloading git-completion.bash"
mkdir ~/.bash_completions
curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/{git-completion.bash}" \
  -o ~/.bash_completions/"#1"
