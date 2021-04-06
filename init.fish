#!/usr/bin/env fish

set DOT_ROOT (readlink -f $PWD/(status dirname))

function log
    echo [(set_color --bold $argv[2])$argv[1](set_color normal)] $argv[3]
end

function info 
    log "INFO" white $argv
end

function success
    log " OK " green $argv
end

function warn
    log "WARN" yellow $argv
end

function skipped
    log "SKIP" magenta $argv
end

function abort
    log "EXIT" red $argv
    exit 1
end

function user 
    log " ?? " white $argv
end

function link_file
    echo $argv | read -l src trgt suffix
    if test -e $trgt 
        #target exist so ensure we are not to distructive
        set newf (readlink $src)
        if test "$newf" = "$trgt"
            success "link exists $src -> $trgt"
            return
        else
            mv $trgt $trgt.$suffix
                and success "backup created: $src.$suffix"
                or abort "failed to backup $trgt as $trgt.$suffix"
        end
    end
    mkdir -p (dirname $trgt)
    and ln -sf $src $trgt
    and success "linked $src -> $trgt"
    or abort "could not link $src to $trgt"
end


# start the configure process
for cfg in $DOT_ROOT/**/configure.fish
    set name (basename (dirname $cfg))
    source $cfg

    switch $status
        case 0
            success "$name configured"
        case 1
            skipped "$name not installed"
        case 255
            exit $status
        case '*'
            abort "$named failed with status $status"
    end
end
