#!/usr/bin/env bash

# Decomposed into multiple files
for file in ~/.{prompt,exports,aliases,workrc}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Use FZF in Bash with Ctrl-T or **. Requires: 'apt-get install fzf'
if [ -d /usr/share/doc/fzf ]; then
    source /usr/share/doc/fzf/examples/key-bindings.bash
    source /usr/share/doc/fzf/examples/completion.bash
fi

# Load completions (bash, git, etc)
# Additional completions:
#   $ npm completion > /usr/share/bash-completion/completions/npm
#   $ node --completion-bash > /usr/share/bash-completion/completions/node
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
    . /usr/share/bash-completion/completions/git
fi
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

