#!/usr/bin/env fish

if not command -sq alacritty
    exit 1
end

link_file $DOT_ROOT/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml backup