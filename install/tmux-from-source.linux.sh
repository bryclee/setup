sudo apt-get install -y autogen automake libevent-dev libncurses5-dev

git clone https://github.com/tmux/tmux sources/tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
pushd sources/tmux

# TODO: Something about this is still screwed up. Had to manually run these steps.
sh autogen.sh
./configure && make

popd
