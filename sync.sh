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
    read -p "From '$1' to '$2'. Proceed? (y/n) " -r -n 1;
    printf '\n'
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        for filename in "${fileset[@]}"; do
            printf '  %s\n' "$filename"
            rm "$2/$filename" 2>/dev/null
            cp "$1/$filename" "$2/$filename" 2>/dev/null
        done
        printf 'Done.\n'
    else
        printf 'Aborted.\n'
    fi
}

if [ "$1" == "--install" ]; then
    printf 'This will overwrite dotfiles in your home directory.\n'
    sync "$dir" "$HOME"
elif [ "$1" == "--backup" ]; then
    printf 'This will backup your dotfiles (without commit).\n'
    sync "$HOME" "$dir"
elif [ "$1" == "--stash" ]; then
    printf 'This will stash your current dotfiles.\n'
    stash="$dir/stash-$(date +%F-%s)"
    mkdir -p "$stash"
    sync "$HOME" "$stash"
else
    printf 'Usage:\n'
    printf '  $ sync --install    # Use the dotfiles from this repo.\n'
    printf '  $ sync --backup     # Save the dotfiles from this machine.\n'
    printf '  $ sync --stash      # Save a dated directory from this machine.\n'
fi

