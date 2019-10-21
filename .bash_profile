#!/usr/bin/env bash

# enable colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxGxGx

# get current git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt like `gabs@dev ~/src/dotfiles (master) $ `
green="\e[0;32m";
blue="\e[0;34m";
cyan="\e[0;36m";
reset="\e[0m";
PS1=""
PS1+="\[${cyan}\]\u@\h ";                 # User and Host
PS1+="\[${blue}\]\w";                     # Working directory
PS1+="\[${green}\]\$(parse_git_branch)";  # Git branch if any
PS1+="\[${blue}\] $ ";                    # Dollar prompt
PS1+="\[${reset}\]";                      # Reset color
export PS1;

# Autocompletion
source "$HOME/.git-completion.bash" 2> /dev/null
source "$HOME/.npm-completion.bash" 2> /dev/null

# Aliases
source "$HOME/.aliases" 2> /dev/null
source "$HOME/.workrc" 2> /dev/null

# Editor
export GIT_EDITOR="subl --wait --new-window"

# Prefer US English and use UTF-8
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Don’t clear the screen after quitting a manual page
export MANPAGER='less -X'

# Better history
export HISTCONTROL=ignoreboth:erasedups

# Increase Bash history size. Allow 32³ entries; the default is 500
export HISTSIZE='32768'
export HISTFILESIZE="${HISTSIZE}"

# Omit duplicates and commands that begin with a space from history
export HISTCONTROL='ignoreboth'

# Enable persistent REPL history for `node`
export NODE_REPL_HISTORY=$HOME/.node_history

# Allow 32³ entries; the default is 1000
export NODE_REPL_HISTORY_SIZE='32768'

# Linux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Pip
    PATH="$HOME/.local/bin/:$PATH"
    # http://git.io/n-install-repo
    export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
    # cowsay custom path
    export COWPATH="/usr/share/cowsay/cows"
fi

# Darwin
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Install with brew
    PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
    PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
    export COWPATH=/usr/local/Cellar/cowsay/3.04/share/cows
fi

# Welcome
if [[ -d "$HOME/.cowfiles" ]] ; then
    COWPATH="$COWPATH:$HOME/.cowfiles"
    fortune -as | cowsay -f dakota
fi
