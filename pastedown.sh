#!/bin/bash
function pastebin-cli {
echo "installing pipx & pastebin-cli..."
which pipx
if [ $? -eq 1 ]; then
       pip install pipx
pipx install pastebin-cli && echo "done"
fi
}


function download {
    set -uo pipefail
    # Create the directory if it doesn't exist
    mkdir -p $HOME/Documents/dotties &> /dev/null

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
    echo "copying files..."
    echo " "
    cp -vf config.fish $fishloc
    cp -vf aliases.fish $fishloc/conf.d/
    cp -vf zoxide.fish $fishloc/conf.d/
    cp -vf env.fish $fishloc/conf.d/
    cd $HOME
}

function fisher {
    if [ ! -f "$HOME/.config/fish/fish_plugins" ]; then
        curl -sL "https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish" | fish
    fi
    echo "installing plugins"
    fish -c "fisher install patrickf1/fzf.fish"
    fish -c "fisher install jorgebucaran/spark.fish"
    fish -c "fisher install IlanCosman/tide@v6"
    echo "currently installed:"
    fish -c "fisher list"
}

#fire
pastebin-cli && download && place && fisher
