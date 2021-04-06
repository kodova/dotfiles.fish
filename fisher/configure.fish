#!/usr/bin/env fish


if not type -q fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end


link_file $DOT_ROOT/fisher/plugins $__fish_config_dir/fish_plugins backup
    or abort 'failed to backup fisher pulugins'

fisher update

set -gx PROJECT_PATHS ~/Workspace