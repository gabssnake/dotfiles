#!/usr/bin/env bash

# Decomposed into multiple files
for file in ~/.{prompt,exports,aliases,workrc}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# On mac, load brew path
if [ -f /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Brew bash completion
if type brew &>/dev/null; then
    if [ -f "$(brew --prefix git)/etc/bash_completion.d/git-completion.bash" ]; then
        source "$(brew --prefix git)/etc/bash_completion.d/git-completion.bash"
    fi
    # brew install bash-completion@2
    if [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
        source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
    fi
fi

