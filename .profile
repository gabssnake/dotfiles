#!/usr/bin/env bash

# Decomposed into multiple files
for file in ~/.{prompt,exports,aliases,workrc}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Load completions (bash, git, etc)
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Additional completions:
#   $ npm completion > /etc/bash_completion.d/npm
#   $ node --completion-bash > /etc/bash_completion.d/node

