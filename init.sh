#!/bin/bash
set -e

# Update apt.
sudo apt update
sudo apt -y upgrade

# Install git first.
sudo apt install -y git

# Make ssh keys.
ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo "GitHubに公開鍵を登録してください:"
cat ~/.ssh/id_ed25519.pub
read -rp "登録が完了したらEnterを押してください..."

# Clone dotfiles.
DOTFILES_DIR="$HOME/dotfiles-Ubuntu"
if [ ! -d "$DOTFILES_DIR/.git" ]; then
    git clone git@github.com:Tobiuo1022/dotfiles-Ubuntu "$DOTFILES_DIR"
fi

# Run setup scripts.
bash "$DOTFILES_DIR/task/setting.sh"
bash "$DOTFILES_DIR/task/install.sh"
bash "$DOTFILES_DIR/task/link.sh"
