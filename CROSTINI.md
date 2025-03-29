- Install C compiler tools for `TsInstall` and other tools

```sh
sudo apt install build-essential gcc
```

- Install [brew](https://brew.sh)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# if above doesn't work due to sudo password missing
CI=true /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Install tmux and neovim with brew

```sh
brew install tmux
brew install neovim
```

- Setup git cache for PAT

```sh
echo 'machine github.com login <login> password <PAT> protocol https' > ~/.netrc

gpg --gen-key
gpg -e -r <email-used-for-gpg> ~/.netrc # Should be re-run if regenerating password
git config credential.helper "netrc -f ~/.netrc.gpg -v"
# Remove clear text netrc file
rm ~/.netrc
```

- [Install node](./install/node.linux.sh)

- Install rg

```sh
brew install rg
```
