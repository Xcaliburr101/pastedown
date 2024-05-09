#!/bin/bash

set -euo pipefail
#set error handling

declare -A urls=(
    [aliases]="https://pastebin.com/0kPtr0QV"
    [bashrc]="https://pastebin.com/WMmk7Cc0"
    [config.fish]="https://pastebin.com/BZ8j6NBC"
    [env.fish]="https://pastebin.com/8yReRyaa"
)

for url in "${!urls[@]}"; do
    echo "Downloading $url..."
        pastebin get "${urls[$url]}" > ".$url"
    echo "file created .$url"
    echo ""
done




