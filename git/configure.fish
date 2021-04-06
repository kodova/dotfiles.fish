#!/usr/bin/env fish

if not command -q git
    exit 1
end


abbr -a gco 'git checkout'
abbr -a gst 'git status'
abbr -a gc 'git commit'

if test -z (git config --global --get user.email)
    info "Need to set up git"
    read -P (user "author: ") user_name
    test -n $user_name
        or abort "author is required"

    read -P (user "email: ") user_email
    test -n $user_email
        or abort "email is required"

    git config --global user.name $user_name
        and git config --global user.email $user_email
        or abort 'failed to setup git user name and email'
end
