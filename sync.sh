#!/usr/bin/env bash

dir=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

fileset=(
  .aliases
  .bashrc
  .exports
  .gitconfig
  .gitignore
  .hushlogin
  .mocharc
  .profile
  .prompt
  .vimrc
)

function sync {
    read -p "From '$1' to '$2'. Proceed? (y/n) " -n 1;
    echo ''
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        for filename in "${fileset[@]}"; do
            echo "  $filename"
            rm "$2/$filename"
            cp "$1/$filename" "$2/$filename"
        done
        echo 'Done.'
    else
        echo 'Aborted.'
    fi
}

if [ "$1" == "--install" ]; then
    echo 'This will overwrite dotfiles in your home directory.'
    sync "$dir" "$HOME"
elif [ "$1" == "--backup" ]; then
    echo 'This will backup your dotfiles (without commit).'
    sync "$HOME" "$dir"
else
    echo 'Usage:'
    echo '  $ sync --install'
    echo '  $ sync --backup'
fi

