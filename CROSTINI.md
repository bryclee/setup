change password for user and for root

```
sudo passwd root
sudo passwd <user>
```

install C compiler tools for `TsInstall` and other tools

```
sudo apt install build-essential gcc
```

install snap

```
sudo apt install libsquashfuse0 squashfuse fuse
sudo apt install snapd
```

install neovim

```
sudo snap install nvim --classic
# may need to fix permission when installing with snap
sudo chmod 755 /
```

install [brew](https://brew.sh)

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

install tmux with brew

```
brew install tmux
```

TODO: setup git cache control?
