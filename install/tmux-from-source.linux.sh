# These seem like default requirement?
sudo apt-get install -y automake libtool libevent-dev libncurses5-dev

# Not sure if still need these
# sudo apt-get install -y autogen m4

# Needed this two last time
sudo apt-get install -y pkg-config byacc

git clone https://github.com/tmux/tmux sources/tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
pushd sources/tmux

# TODO: Something about this is still screwed up. Had to manually run these steps.
sh autogen.sh
./configure && make

popd
