# Ubuntu (Desktop) Steps

Other useful things to install (via `apt`)

- `tlp` - power management
- `tweak` - for small UI tweaks

## Other install instructions

- kitty
- configure workspaces
  - mapping for switching to workspaces, sending window to workspaces
- map caps to esc
- window manager?
  - find one that works with desktop?
  - dmenu + xmonad for bare one
  - mod+shift+q to exit
- fzf: from `linuxbrew`
- tmux: from `apt`

wezterm: from APT

```bash
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
```
