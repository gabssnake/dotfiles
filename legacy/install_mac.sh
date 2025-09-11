
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Sublime text Preferences
    cp -r sublime/ "~/Library/Application\ Support/Sublime\ Text*/Packages/User/"

    # Spectacle.app set up keyboard shortcuts
    cp ./spectacle.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null

    # iTerm2.app profiles and settings
    cp ./com.googlecode.iterm2.plist ~/Library/Preferences/
fi
