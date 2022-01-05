#!/usr/bin/env bash

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

function usage {
  echo "Usage:
    $ sync --install    # Use the dotfiles from this repo.
    $ sync --backup     # Save the dotfiles from this machine.
    $ sync --stash      # Save a dated directory from this machine."
  exit 0;
}

function main {
  # help when no arguments or options
  if [[ $# == 0 ]]; then usage; fi

  # extract options from arguments
  opts=(); while :; do if [[ $1 == -?* ]]; then opts+=("$1"); else break; fi; shift; done

  # expects to be run from the dotfiles repo
  dir=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

  for opt in "${opts[@]}"; do
    case "$opt" in
      -i|--install)
        printf 'This will overwrite dotfiles in your home directory.\n'
        sync "$dir" "$HOME"
        break;;
      -b|--backup)
        printf 'This will backup your dotfiles (without commit).\n'
        sync "$HOME" "$dir"
        break;;
      -s|--stash)
        printf 'This will stash your current dotfiles.\n'
        stash="$dir/stash-$(date +%F-%s)"
        mkdir -p "$stash"
        sync "$HOME" "$stash"
        break;;
      *)
        usage;;
    esac
  done
}

main "$@"

