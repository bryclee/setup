mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
# # for now, default version will be node 8
. ~/.nvm/nvm.sh
. ~/.nvm/bash_completion
nvm install 12
nvm alias default 12
./safelyLink.sh .nvm/default-packages ~/.nvm

