#!/usr/bin/env fish
set -g TERM xterm-256color-italic

# Language Default
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

set -gx GOPATH $HOME/.go
set -gx PATH $GOPATH/bin $PATH
set -gx PATH .local/bin $PATH
set -gx PATH $HOME/.bin $PATH

# editor
set -gx EDITOR micro
set -gx VISUAL micro
set -gx GIT_EDITOR 'micro'


# os-specific stuff
set -gx OSTYPE (uname)
switch $OSTYPE
  case "Linux"
    # figure out which clipboard to use
    if command -v xsel >/dev/null
        set -gx CLIPBOARD xsel --clipboard --input
        set -gx PASTEBOARD xsel --clipboard --output
    else if command -v xclip >/dev/null; then
        set -gx CLIPBOARD xclip -selection clipboard
        set -gx PASTEBOARD xclip -selection clipboard -o
    end

    abbr pbcopy $CLIPBOARD
    abbr pbpaste $PASTEBOARD

    # add .local to path (used by pip/pip3)
    set -gx PATH ~/.local/bin $PATH
  case "Darwin"
    set -gx CLIPBOARD pbcopy
    set -gx PASTEBOARD pbcopy
end

# FZF fuzzy finder
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!{.git,.svn,*.map,*.min*,**/min/**,**/js/build/**,**/node_modules/**,**/bower_components/**}"'

# Colorful man pages
set -gx LESS_TERMCAP_mb (set_color -o red)
set -gx LESS_TERMCAP_md (set_color -o red)
set -gx LESS_TERMCAP_me (set_color normal)
set -gx LESS_TERMCAP_se (set_color normal)
set -gx LESS_TERMCAP_so (set_color -b blue -o yellow)
set -gx LESS_TERMCAP_ue (set_color normal)
set -gx LESS_TERMCAP_us (set_color -o green)


# grep colors
 setenv -x GREP_OPTIONS "--color=auto"

