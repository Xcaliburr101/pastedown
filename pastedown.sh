#!/bin/bash

function download {
    set -uo pipefail
    mkdir -p "$HOME/Documents/dotties" &> /dev/null

    declare -A urls=(
         [config.fish]="https://pastebin.com/BZ8j6NBC"
         [aliases.fish]="https://pastebin.com/0kPtr0QV"
         [env.fish]="https://pastebin.com/8yReRyaa"
         [zoxide.fish]="https://pastebin.com/6wW6YEvz"
    )

    for url in "${!urls[@]}"; do
        local file_path="$HOME/Documents/dotties/$url"
        echo "Downloading $url..."
        if pastebin get "${urls[$url]}" > "$file_path"; then
            echo "Saved file to $file_path"
        else
            echo "Error: Failed to download $url" >&2
        fi
    done
}

function place {
fishloc="$HOME/.config/fish/"
cd $HOME/Documents/dotties/

cp -v config.fish $fishloc
cp -v aliases.fish $fishloc/conf.d/
cp -v zoxide.fish $fishloc/conf.d/
cp -v env.fish $fishloc/conf.d/

}

#fire
download && place
