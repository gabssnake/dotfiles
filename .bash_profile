
# enable colors
export CLICOLOR=1;
export LSCOLORS=gxBxhxDxfxhxhxhxhxGxGx;

# get current git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/';
}


# Prompt like `gabs ~/src/dotfiles (master) $ `
green="\e[0;32m";
blue="\e[0;34m";
cyan="\e[0;36m";
reset="\e[0m";
PS1=""
# PS1+="\[${cyan}\]\u ";                  # Username
PS1+="\[${blue}\]\w";                     # Working directory
PS1+="\[${green}\]\$(parse_git_branch)";  # Git branch if any
PS1+="\[${blue}\] $ ";                    # Dollar prompt
PS1+="\[${reset}\]";                      # Reset color
export PS1;


# Brew tools
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH";
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"


# Autocompletion
source ~/.git-completion.bash;
source ~/.npm-completion.bash;

# Aliases
source ~/.aliases;


# Editor
export GIT_EDITOR="subl --wait --new-window";

# Better history
export HISTCONTROL=ignoreboth:erasedups;

# Prefer US English and use UTF-8
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page
export MANPAGER='less -X';


# Increase Bash history size. Allow 32³ entries; the default is 500
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";

# Omit duplicates and commands that begin with a space from history
export HISTCONTROL='ignoreboth';

# Enable persistent REPL history for `node`
export NODE_REPL_HISTORY=~/.node_history;

# Allow 32³ entries; the default is 1000
export NODE_REPL_HISTORY_SIZE='32768';


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

# small, moose, dakota
# COWPATH=/usr/local/Cellar/cowsay/3.03/share/cows
fortune -as | cowsay -f dakota
