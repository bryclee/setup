cd ~

sudo apt-get update -y
sudo apt-get install git -y

git clone https://www.github.com/bryclee/setup
cd setup

# Run the installation for the submodules
git submodule init
git submodule update

# Run the link script to link vim and other rc files
. ./link.sh
