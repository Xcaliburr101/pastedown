#!/usr/bin/env fish
if status is-interactive
    # Commands to run in interactive sessions can go here
end

#sources
zoxide init fish | source
fzf --fish | source
