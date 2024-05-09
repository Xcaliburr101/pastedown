#!/bin/bash

set -euo pipefail
#set error handling

declare -A urls=(
    [aliases]="https://pastebin.com/0kPtr0QV"
    [bashrc]="https://pastebin.com/WMmk7Cc0"
    [config]="https://pastebin.com/BZ8j6NBC"
    [fish-env]="https://pastebin.com/8yReRyaa"
    [fishconfig]="https://pastebin.com/BZ8j6NBC"
)

for key in "${!urls[@]}"; do
    echo "Downloading $key..."
    pastebin get "${urls[$key]}"
done




