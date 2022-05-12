Change password for user and for root

```
sudo passwd root
sudo passwd <user>
```

Install C compiler tools for `TsInstall` and other tools

```
sudo apt install build-essential gcc
```

Install snap

```
sudo apt install libsquashfuse0 squashfuse fuse
sudo apt install snapd
```

Install neovim with snap

```
sudo snap install nvim --classic
# may need to fix permission when installing with snap
sudo chmod 755 /
echo 'alias vi=nvim' >> ~/.bashrc_local
sudo update-alternatives --install /usr/bin/editor editor $(which nvim) 100
```

Install [brew](https://brew.sh)

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install tmux with brew

```
brew install tmux
```

Setup git cache for PAT

```
echo 'machine github.com login <login> password <PAT> protocol https' > ~/.netrc
# First time gpg setup
gpg --gen-key
gpg -e -r <email-used-for-gpg> ~/.netrc
git config credential.helper "netrc -f ~/.netrc.gpg -v"
# Remove clear text netrc file
rm ~/.netrc
```

[Install node](./install/node.linux.sh)

Install rg

```
brew install rg
```
