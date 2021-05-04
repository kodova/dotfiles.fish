#!/usr/bin/env fish

if not command -sq exa
    exit 1
end

# Replace ls with exa
alias -s ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias -s la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias -s ll='exa -l --color=always --group-directories-first --icons'  # long format
alias -s lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias -s l.="exa -a | egrep '^\.'"                                     # show only dotfiles
