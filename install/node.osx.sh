mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
# # for now, default version will be node 8
. ~/.nvm/nvm.sh
. ~/.nvm/bash_completion
nvm install 8
nvm alias default 8
./safelyLink.sh .nvm/default-packages ~/.nvm

