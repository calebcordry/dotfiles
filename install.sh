#!/bin/zsh

# Installs dotfiles.

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

Names=(".gitconfig" ".gitmodules" ".vim" ".vimrc" ".zshrc")

# Get root
SCRIPT_PATH=$(realpath $0)
DOTFILES=$(dirname $SCRIPT_PATH)

# Install dotfiles
for f in "${Names[@]}"; do
    echo "linking $DOTFILES/$f to $HOME"
    ln -fsn "$DOTFILES/$FILE" "$HOME"
echo $f
done

git submodule init && git submodule update
