#!/bin/bash
set -e

DOTFILES="$HOME/dotfiles-Ubuntu"

link() {
    local src="$1"
    local dest="$2"

    mkdir -p "$(dirname "$dest")"
    ln -sfn "$src" "$dest"
    echo "Linked: $dest -> $src"
}

link "$DOTFILES/.bash_aliases"          "$HOME/.bash_aliases"
link "$DOTFILES/.bash_profile"          "$HOME/.bash_profile"
link "$DOTFILES/.bashrc"                "$HOME/.bashrc"
link "$DOTFILES/.config/nvim"           "$HOME/.config/nvim"
link "$DOTFILES/.config/git/ignore"     "$HOME/.config/git/ignore"
link "$DOTFILES/.ssh/config"            "$HOME/.ssh/config"
