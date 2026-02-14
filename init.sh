#!/bin/bash

# Update apt.
sudo apt update
sudo apt -y upgrade

# Make ssh keys. 
ssh-keygen -t ed25519
ssh-add ~/.ssh/id_ed25519
ssh-add -l

# Clone the files on Github. 
apt install git

printf "GitHubに公開鍵を貼り付けてください. "
cat ~/.ssh/id_ed25519.pub
read enter

git clone git@github.com:Tobiuo1022/dotfiles ~/dotfiles

# run the scripts. 
bash ~/dotfiles/task/setting.sh
bash ~/dotfiles/task/install.sh
bash ~/dotfiles/task/link.sh
