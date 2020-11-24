
# enable colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxGxGx

# get current git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt like `gab@dev ~/src/dotfiles (master) $ `
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

# Editor
export GIT_EDITOR="subl --wait --new-window"

# Prefer US English and use UTF-8
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Highlight section titles in manual pages
export LESS_TERMCAP_md="${yellow}"

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
export NODE_REPL_HISTORY=~/.node_history

# Allow 32³ entries; the default is 1000
export NODE_REPL_HISTORY_SIZE='32768'

# Autocompletion
source ~/.git-completion.bash 2> /dev/null
source ~/.npm-completion.bash 2> /dev/null

# Aliases
source ~/.bash_aliases 2> /dev/null
source ~/.workrc 2> /dev/null


# Darwin
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "darwin";
fi

# Linux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "linux";
fi

# Welcome
if [ -d "$HOME/.cowfiles" ] ; then
    COWPATH="$COWPATH:$HOME/.cowfiles"
    fortune -as | cowsay -f dakota | lolcat
fi

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
