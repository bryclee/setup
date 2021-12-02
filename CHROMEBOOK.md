# Chromebook specific setup

## Crouton

- [Crouton](https://github.com/dnschneid/crouton/)
- Install [Secure Shell App](https://chrome.google.com/webstore/detail/secure-shell-app/pnhechapfaindjhompbnflcldabbghjo?hl=en), offers slightly better terminal experience
  - Afterwards, import the [backup settings](<./chromebook/Secure\ Shell\ Preferences\ Backup.json>) which already has the color scheme setup
- [Solarized color theme](https://github.com/jarlg/solarized-crosh)
- Start from `crosh` with:

```
shell
sudo startcli
```

- Clipboard integration with CLI can be done following steps of [croshclip](https://github.com/acornejo/croshclip)
  - After downloading, run the following steps instead of the provided ones:

  ```
  # Install step mirroring crouton install step
  sudo install -Dt /usr/local/bin -m 755 ~/Downloads/croshclip
  # Location of file to start this in is up to the user
  echo 'nc -z localhost 30001 || croshclip -serve > /tmp/croshclip.log 2>&1 &' > ~/.bashrc_local
  ```

