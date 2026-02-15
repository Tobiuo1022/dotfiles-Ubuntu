#!/bin/bash

apt install tree 
apt install neovim 

# asdf
apt install golang-go 
git clone https://github.com/asdf-vm/asdf.git ~/dotfiles/.asdf --branch v0.18.0
make --directory ~/dotfiles/.asdf
mv ~/dotfiles/.asdf/asdf /usr/local/bin/

# markmap
asdf plugin add nodejs
asdf install nodejs 24.12.0
npm install -g markmap-cli

# fzf 
apt install fzf
git clone https://github.com/junegunn/fzf $HOME/dotfiles/.config/nvim/pack/vendo/start/fzf
git clone https://github.com/junegunn/fzf.vim $HOME/dotfiles/.config/nvim/pack/vendo/start/fzf.vim

# Docker
## Add Docker's official GPG key:
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

## Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

## Install Docker's packages. 
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Mount to google Drive. 
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt install google-drive-ocamlfuse

mkdir ~/gdrive
printf "google Driveへのアクセスを許可してください. "
google-drive-ocamlfuse -id 829075573210-lchjp242s8ft8e3biod1k0poqfpk1uoh.apps.googleusercontent.com -secret REMOVED
read enter
google-drive-ocamlfuse ~/gdrive/
