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

- Github auth: Use `gh` CLI for login (`gh auth login`, and `gh auth setup-git`)
- Install `mise`
  - [Mise](https://mise.jdx.dev/getting-started.html)
  ```
  brew install mise
  echo 'eval "$(mise activate bash)"' >> ~/.bashrc_local
  mise use --global node@22 # or whatever needed version
  ```
- [Install node](./install/node.linux.sh)

- Install rg

```sh
brew install rg
```

- Install [Aider Chat](https://aider.chat/docs/install.html)

```sh
python -m pip install aider-Install # python installed through mise
aider-install
```
