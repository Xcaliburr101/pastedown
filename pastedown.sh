#!/bin/bash

set -uo pipefail
#set error handling

declare -A urls=(
    [aliases.fish]="https://pastebin.com/0kPtr0QV"
    [bashrc]="https://pastebin.com/WMmk7Cc0"
    [config.fish]="https://pastebin.com/BZ8j6NBC"
    [env.fish]="https://pastebin.com/8yReRyaa"
)

for url in "${!urls[@]}"; do
    echo "Downloading $url..."
    mkdir -p dotties &> /dev/null
    pastebin get "${urls[$url]}" > "dotties/.$url"
    echo "saved file to .$url"
done