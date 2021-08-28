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
  # Legacy files
  .bash_profile
  .bash_aliases
  .gitignore_global
  .npm-completion.bash
  .node-completion.bash
  .git-completion.bash
  .mocharc.yml
)

function sync {
    read -p "From '$1' to '$2'. Proceed? (y/n) " -n 1;
    echo ''
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        for filename in "${fileset[@]}"; do
            echo "  $filename"
            rm "$2/$filename" 2>/dev/null
            cp "$1/$filename" "$2/$filename" 2>/dev/null
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
elif [ "$1" == "--stash" ]; then
    echo 'This will stash your current dotfiles.'
    stash="$dir/stash-$(date +%F-%s)"
    mkdir -p "$stash"
    sync "$HOME" "$stash"
else
    echo 'Usage:'
    echo '  $ sync --install'
    echo '  $ sync --backup'
    echo '  $ sync --stash'
fi

