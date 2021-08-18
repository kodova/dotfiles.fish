#!/usr/bin/env fish

if not command -sq vim
    exit 1
end

set -Ux EDITOR vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

link_file $DOT_ROOT/vim/vimrc $HOME/.vimrc backup

