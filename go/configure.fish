#!/usr/bin/env fish

if not command -sq go
    exit 1
end

fish_add_path (go env GOPATH)/bin
set -x GOPRIVATE "github.com/geniusmonkey"