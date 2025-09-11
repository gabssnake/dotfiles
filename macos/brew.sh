
# SSH keys
# eval "$(ssh-agent -s)" && ssh-add --apple-use-keychain ~/.ssh/<identity>

# Essential dotfiles
# git clone git@github.com:gabssnake/dotfiles.git
# cd dotfiles
# ./sync.sh --install

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# macOS comes with bash 3.2, brew has 5.3.3
brew install bash
brew install bash-completion@2

# macOS comes with git 2.39.5, brew has 2.51.0
brew install git
brew install git-lfs
git lfs install

# More recent versions of some GNU tools
brew install coreutils
brew install grep
brew install gnu-sed
brew install vim
brew install ack
brew install telnet
brew install wget

# Node.js version management
# Needs N_PREFIX=$HOME/n set in dotfiles to avoid sudo
brew install n
n tls

# Once Sublime is installed, add basic packages
# 	Tools > Install Package Control
# 	Cmd + Shift + p > Install new package > AdvancedNewFile
# 	Cmd + Shift + p > Install new package > SideBarEnhancements
brew install --cask sublime-text

# Too lazy to download app manually
brew install --cask iterm2
brew install --cask spotify
brew install --cask visual-studio-code
brew install --cask firefox@developer-edition
brew install --cask google-chrome

# Remove outdated versions from the cellar
brew cleanup
