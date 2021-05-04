#!/usr/bin/env fish

if not command -q starship
    exit 1
end

link_file $DOT_ROOT/starship/starship.toml $HOME/.config/starship.toml backup
