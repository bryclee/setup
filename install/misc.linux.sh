sudo apt-get install -y silversearcher-ag bash-completion ripgrep fzf

# For gnome desktop, set key repeat rate
if [ -n "$(which gsettings)" ]
then
  gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 15
  gsettings set org.gnome.desktop.peripherals.keyboard delay 250
fi
