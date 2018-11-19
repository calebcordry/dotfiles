#!/bin/zsh

# Installs dotfiles.

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

# List of files to be linked.
Names=(
  ".gitconfig" 
  ".gitmodules" 
  ".tmux.conf"
  ".vim" 
  ".vimrc" 
  ".zshrc"
)

# Get root
SCRIPT_PATH=$(realpath $0)
DOTFILES=$(dirname $SCRIPT_PATH)

# Install dotfiles
for f in "${Names[@]}"; do
    echo "linking $DOTFILES/$f to $HOME"
    ln -fsh "$DOTFILES/$f" "$HOME"
done

# Link fzf binary so that it's available to vim
# (fzf should already be installed)
ln -fsh /usr/local/opt/fzf "$HOME/.vim/pack/default/start"
