# Install dependencies
sudo apt-get update -y
sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
  libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
  libcairo2-dev libx11-dev libxpm-dev libxt-dev

# Build and install vim
git clone https://github.com/vim/vim.git sources/vim
pushd sources/vim
./configure --with-features=huge
sudo checkinstall

# Set it as the default
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim

popd
