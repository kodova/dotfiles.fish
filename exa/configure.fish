#!/usr/bin/env fish

if not command -sq exa
    exit 1
end

alias -s ls="exa $argv"
alias -s ll="exa -al $argv"

