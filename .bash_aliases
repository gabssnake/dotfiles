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

  # Reset changes, including newly created files
  alias nah="git reset --hard; git clean -df"

  # Include changes into last commit
  alias yep="git a && git commit --amend --no-edit"

  # Undo last commit and move files in commit to staging
  alias undo="git reset --soft HEAD^"

  # Show the last bit of the git log
  alias lol="clear && git lola --color=always | head -n 20"

  # Interactive rebase of last n commits
  alias reb="git rebase -i HEAD~8"

  # never push force
  alias please="git push --force-with-lease"

  # Reset local branch to matching remote
  alias drop="git reset --hard @{upstream}"


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

  # Open current folder in Sublime or VSCode
  alias s='subl .'
  alias c='code .'

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

