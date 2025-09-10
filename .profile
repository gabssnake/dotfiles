#!/usr/bin/env bash

# Decomposed into multiple files
for file in ~/.{prompt,exports,aliases,workrc}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


# Use FZF in Bash with Ctrl-T or **. Requires: 'apt-get install fzf'
#
# Linux
if [ -d /usr/share/doc/fzf ]; then
    source /usr/share/doc/fzf/examples/key-bindings.bash
    source /usr/share/doc/fzf/examples/completion.bash
fi


# Load completions (bash, git, etc)
# Additional completions:
#   $ npm completion > /usr/share/bash-completion/completions/npm
#   $ node --completion-bash > /usr/share/bash-completion/completions/node
#
# Linux
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
    . /usr/share/bash-completion/completions/git
fi
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


# On mac, load brew path
if [ -f /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Used for node and npm
# http://git.io/n-install-repo
export N_PREFIX="$HOME/n";
[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

# Rust cargo
. "$HOME/.cargo/env"

# Deno
export DENO_INSTALL="/Users/gabriel.vivas/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Python pipx
export PATH="$PATH:/Users/gabriel.vivas/.local/bin"
. "/Users/gabriel.vivas/.deno/env"

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
export GROOVY_HOME=/opt/homebrew/opt/groovy/libexec
export PATH="/opt/homebrew/opt/python@3.13/libexec/bin:$PATH"
