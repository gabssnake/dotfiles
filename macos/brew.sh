
# Ask for the administrator password upfront
sudo -v

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/cask
brew tap caskroom/versions

brew install brew-cask

brew cask install spectacle
brew cask install caffeine
brew cask install the-unarchiver
brew cask install mplayerx
brew cask install cheatsheet
brew cask install spotify

brew cask install iterm2
brew cask install sublime-text
brew cask install visual-studio-code
brew cask install macdown
brew cask install google-chrome
brew cask install firefox-developer-edition
brew cask install vagrant
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install wireshark
brew cask install cyberduck
brew cask install transmission
brew cast install appcleaner

brew install n
sudo n tls


# macOS comes with Bash 3.2, Brew gives us Bash 5
brew install bash
brew install bash-completion2

# GNU core utilities that come with macOS are outdated
brew install coreutils

# Install more recent versions of some macOS tools.
brew install vim #--with-override-system-vi
brew install gnu-sed #--with-default-names
brew install wget #--with-iri
brew install grep
brew install telnet
brew install nmap
brew install ack
brew install tldr
brew install cowsay
brew install fortune

brew install git
brew install git-lfs
git lfs install

# NTFS read/write
brew cask install osxfuse
brew install ntfs-3g

# Restart computer with CMD + R => ouvrir un terminal via Utilitaires > Terminal
# csrutil disable
# Restart computer normally
# csrutil status
# If properly disabled run
# sudo mv /sbin/mount_ntfs /sbin/mount_ntfs.original
# sudo ln -s /usr/local/sbin/mount_ntfs /sbin/mount_ntfs
# Restart computer with CMD + R
# csrutil enable


# Remove outdated versions from the cellar
brew cleanup
