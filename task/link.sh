#!/bin/bash

DOTFILES="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles/task/link_backup"
mkdir -p $BACKUP_DIR

link() {
    local src="$1"
    local dest="$2"

    if [ -L "$dest" ]; then
        mv "$dest" "$BACKUP_DIR/"
    fi

    ln -s "$src" "$dest"
}

link $DOTFILES/.asdf $HOME/.asdf

link $DOTFILES/.bash_aliases $HOME/.bash_aliases
link $DOTFILES/.bash_profile $HOME/.bash_profile
link $DOTFILES/.bashrc $HOME/.bashrc

mkdir -p $HOME/.config
link $DOTFILES/.config/nvim $HOME/.config/nvim

mkdir -p $HOME/.config/git
link $DOTFILES/.config/git/ignore $HOME/.config/git/ignore

mkdir -p $HOME/.ssh
link $DOTFILES/.ssh/config $HOME/.ssh/config
