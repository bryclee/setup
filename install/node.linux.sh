# Install https://github.com/nvm-sh/nvm
mkdir ~/.nvm
export NVM_DIR=~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.40.2/install.sh | bash
. ~/.nvm/nvm.sh
. ~/.nvm/bash_completion
./safelyLink.sh .nvm/default-packages ~/.nvm
nvm install 22
nvm alias default 22
