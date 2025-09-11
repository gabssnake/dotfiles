
## Terminal color scheme (iTerm, not Terminal)
# https://github.com/Gogh-Co/Gogh
# Nice color themes:
#   03 08 11 13 17 18 29 32 35 51 54 66 67 69 90 93 96
#   104 109 110 111 112 114 122 136 138 142 144 147 152
alias colorscheme='bash -c "$(curl -sLo- https://git.io/vQgMr)"'



## Utilities

  # Show global modules
  alias npmls='npm list -g --depth=0'
  alias rustls='\ls -p ~/.cargo/bin/ | grep -v "\/\|rust\|cargo\|clippy"'
  alias gols='\ls -p /usr/local/go/bin/ | grep -v "\/\|^go$\|^gofmt$"'

  # See: https://github.com/adriancooney/Taskfile
  alias task=./Taskfile



# brew cask install vagrant
# brew cask install virtualbox
# brew cask install virtualbox-extension-pack
# brew cask install wireshark
# brew cask install cyberduck
# brew cask install transmission
# brew cast install appcleaner


pip3 install --user termtosvg
npm -g install localtunnel
sudo apt-get install tldr



# apt-get install fortune cowsay
# npm install --global lolcat
if [ -d "$HOME/.cowfiles" ] ; then
    export COWPATH="/usr/share/cowsay/cows/:$HOME/.cowfiles"
    fortune -as | cowsay -f dakota | lolcat
fi



# Corporate TLS proxies everywhere
export NODE_EXTRA_CA_CERTS=~/.certs/Sonar-FGT-FW-TLS-Traffic-Inspection.cer
export DENO_TLS_CA_STORE=system


# Golang
export GOROOT='/usr/local/go'
export PATH="$PATH:/usr/local/go/bin"

# Rust lang
export PATH="$HOME/.cargo/bin:$PATH"

# Brew python
export PATH="/opt/homebrew/opt/python@3.9/libexec/bin:$PATH"

# macOS python3
export PATH="/Users/gabriel.vivas/Library/Python/3.9/bin:$PATH"

# Java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
export JAVA_HOME=/opt/homebrew/opt/openjdk

# Groovy groovy
export GROOVY_HOME=/opt/homebrew/opt/groovy/libexec

# My bin helpers
export PATH="$HOME/.bin:$PATH"








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


# PATH

  # subl command
  # export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"




####################################
# macos.sh



brew cask install spectacle
brew cask install caffeine
brew cask install the-unarchiver
brew cask install mplayerx
brew cask install cheatsheet

# NTFS read/write
#   brew cask install osxfuse
#   brew install ntfs-3g
# Restart computer with CMD + R => ouvrir un terminal via Utilitaires > Terminal
#   csrutil disable
# Restart computer normally
#   csrutil status
# If properly disabled run
#   sudo mv /sbin/mount_ntfs /sbin/mount_ntfs.original
#   sudo ln -s /usr/local/sbin/mount_ntfs /sbin/mount_ntfs
# Restart computer with CMD + R
#   csrutil enable




####################################
# .alias



# When you forget to push with `-u`
alias predrop='git branch --set-upstream-to=origin/$(git rev-parse --abbrev-ref HEAD)'

# Switch back and forth between last branches
alias pop='git switch -'



####################################
# .profile

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


# Bash completions (/opt/homebrew/etc/bash_completion.d/)
brew install bash-completion@2

# For some reason, this doesn't really work
# bash-completion@2 is supposed to use this folder for lookup
npm completion > $(brew --prefix)/share/bash-completion/completions/npm
node --completion-bash > $(brew --prefix)/share/bash-completion/completions/node
chmod 755 $(brew --prefix)/share/bash-completion/*




####################################
# .gitconfig

[credential]
  helper = cache
  ; helper = osxkeychain


; [includeIf "gitdir:~/src/smc/"]
  ; path = ~/.workrc.gitconfig

; [blame]
  ; ignoreRevsFile = ~/.revsignore

