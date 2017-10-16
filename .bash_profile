
# editor
export GIT_EDITOR="subl --wait --new-window"

# better history
export HISTCONTROL=ignoreboth:erasedups

# enable colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxGxGx

# get current git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# PS1 line 
export PS1="\[\e[0;36m\]\u \[\e[0;34m\]\w\[\e[0;32m\]\$(parse_git_branch) \[\e[0;34m\]$ \[\e[m\]"

# brew
export PATH="/usr/local/sbin:$PATH"

# autocompletion
source ~/.git-completion.bash
source ~/.npm-completion.bash

# aliases
source ~/.aliases

# make rm command send stuff to .trash
function rm () {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
      local dst=${path##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst="$dst "$(date +%H-%M-%S)
      done
      mv "$path" ~/.Trash/"$dst"
    fi
  done
}

# stegosaurus, small, moofasa, moose, three-eyes
# COWPATH=/usr/local/Cellar/cowsay/3.03/share/cows
fortune -as | cowsay -f small
