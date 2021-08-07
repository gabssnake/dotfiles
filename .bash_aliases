#!/usr/bin/env bash

## Bash

  # -G show colors
  # -p add a slash to folders
  # -F adds more flags to other files
  # -h adds human readable dates
  #  disable temporalily with \ls
  alias ls='ls -laGpFh'

  # Avoid common mistakes
  alias cd..='cd ..'
  alias pnig='ping'
  alias gti='git'

  # -i prompts confirmation
  # -v verbose mode
  # alias rm='rm -iv'
  # alias mv='mv -iv'
  # alias cp='cp -iv'

  # Quick sudo
  alias fuck='sudo $(history -p \!\!)'

  # Always enable colored `grep` output
  alias grep='grep --color=auto'


## Git

  # Files most frequently modified
  alias churn="git log --pretty='format:' --name-only \
    | grep -v ^$ | sort | uniq -c \
    | sed -e 's/^ *//' | sort -rg | head -n 30"

  # Don't judge me
  alias s="git status -sb"

  # Show the last bit of the log
  alias lol="clear; git lola --color=always | head -n 20"

  # Include changes into last commit
  alias yep="git a; git commit --amend --no-edit"

  # Use the force, but never push force
  alias please="git push --force-with-lease"

  # Drop changes, including newly created files
  alias nah="git reset --hard; git clean -df"

  # Reset local branch to matching remote branch
  alias drop="git reset --hard @{upstream}"

  # Rebase local branch over matching remote branch
  alias fwd="git rebase -i @{upstream}"

  # Switch back and forth between last branches
  alias pop="git switch -"

  # Rebase over last branch
  alias reb="git rebase -i -"

  # Undo last commit but leave files for diff
  alias undo="git reset --soft HEAD^ && git reset HEAD --"


## Node
  alias r="npm run"

  # Show global modules
  alias npmls="npm list -g --depth=0"

  # Remove modules for a clean install
  alias prune="rm -rf node_modules && rm -f package-lock.json"

  # Bootstrap quick project folder
  alias init='git init && \
    cat ~/.gitignore_global >> .gitignore && \
    echo "package-lock.json -diff" >> .gitattributes && \
    npm init -y && \
    npm i --save dotenv debug && \
    echo "require(\"dotenv\").config();" >> index.js && \
    echo "DEBUG=*" >> .env'


## Utilities

  # Quickly get ip
  alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

  # Print each PATH entry on a separate line
  alias path='echo -e ${PATH//:/\\n}'

  # Http static server
  alias serve="python -m SimpleHTTPServer 8000"

  # Record terminal with python3 lib
  alias record='termtosvg --theme dracula'

  # npm -g install localtunnel
  alias localtunnel='lt'

  # sudo apt-get install tldr
  alias man="tldr"


## Terminal color scheme

  # https://mayccoll.github.io/Gogh/
  # 03 08 11 13 17 18 29 32 35 51 54 66 67 69 90 93 96
  # 104 109 110 111 112 114 122 136 138 142 144 147 152
  alias colorscheme='bash -c "$(wget -qO- https://git.io/vQgMr)"'

