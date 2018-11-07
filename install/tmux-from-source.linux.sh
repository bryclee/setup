sudo apt-get install -y autogen automake libevent-dev libncurses5-dev

git clone https://github.com/tmux/tmux sources/tmux
pushd sources/tmux

sh autogen.sh
./configure && make

popd
