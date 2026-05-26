#!/bin/bash
set -e

# Basic packages
sudo apt-get update
sudo apt-get install -y tree neovim curl wget fzf golang-go ca-certificates

# asdf (Go binary, v0.18+)
ASDF_VERSION="v0.18.0"
if ! command -v asdf &> /dev/null; then
    curl -fsSL "https://github.com/asdf-vm/asdf/releases/download/${ASDF_VERSION}/asdf-${ASDF_VERSION}-linux-amd64.tar.gz" \
        | sudo tar xz -C /usr/local/bin/
fi

# Node.js via asdf
if ! asdf plugin list 2>/dev/null | grep -q nodejs; then
    asdf plugin add nodejs
fi
if ! asdf list nodejs 2>/dev/null | grep -q "24.12.0"; then
    asdf install nodejs 24.12.0
fi
asdf global nodejs 24.12.0

# npm global packages
npm install -g markmap-cli
npm install -g @anthropic-ai/claude-code

# fzf vim plugins
NVIM_PACK="$HOME/.config/nvim/pack/vendo/start"
mkdir -p "$NVIM_PACK"
[ ! -d "$NVIM_PACK/fzf" ]     && git clone https://github.com/junegunn/fzf     "$NVIM_PACK/fzf"
[ ! -d "$NVIM_PACK/fzf.vim" ] && git clone https://github.com/junegunn/fzf.vim "$NVIM_PACK/fzf.vim"

# Docker
if ! command -v docker &> /dev/null; then
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo usermod -aG docker "$USER"
fi

# Google Drive (optional)
# google-drive-ocamlfuse の設定は手動で行ってください。
# 詳細: https://github.com/astrada/google-drive-ocamlfuse
