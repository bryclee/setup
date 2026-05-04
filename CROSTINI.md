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
  - Install `wl-clipboard` to make clipboard work: `sudo apt install wl-clipboard`
- Github auth: Use `gh` CLI for login (`gh auth login`, and `gh auth setup-git`)
- Install `mise`
  - [Mise](https://mise.jdx.dev/getting-started.html)
  ```sh
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
- Emacs
```sh
sudo apt install emacs

# vterm dependencies: https://github.com/akermu/emacs-libvterm
sudo apt install cmake libtool-bin
```

- Install Gemini CLI
  - [Gemini CLI](https://github.com/google/gemini-cli)
  - Install `bubblewrap` (`bwrap`) to support tool sandboxing:
    ```sh
    sudo apt install bubblewrap
    ```
    *Note: `bwrap` is required if tool sandboxing is enabled in Gemini CLI.*
