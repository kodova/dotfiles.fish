#!/usr/bin/env fish

if not command -sq tmux
    exit 1
end


link_file $DOT_ROOT/tmux/tmux.conf $HOME/.tmux.conf backup

fish_add_path -a $DOT_ROOT/tmux/bin

exit 0

