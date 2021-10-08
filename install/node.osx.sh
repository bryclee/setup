mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.0/install.sh | bash
. ~/.nvm/nvm.sh
. ~/.nvm/bash_completion
nvm install 12
nvm alias default 12
./safelyLink.sh .nvm/default-packages ~/.nvm
