cp .aliases ~/
cp .git-completion.bash ~/
cp .npm-completion.bash ~/
cp .bash_profile ~/
cp .hushlogin ~/
cp .vimrc ~/
cp .gitignore_global ~/
cp .gitconfig ~/
cp .npmrc ~/
cp .eslintrc ~/

chmod +x ./macos.sh
chmod +x ./brew.sh

./macos.sh
./brew.sh


# Spectacle.app set up keyboard shortcuts
cp ./spectacle.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null

# iTerm2.app profiles and settings
cp ./com.googlecode.iterm2.plist ~/Library/Preferences/

# Sublime Text
# - Package Manager
# - Babel
# - JsPrettier
# - SideBarEnhancements
# - SublimeLinter
# - SublimeLinter-contrib-htmlhint
# - SublimeLinter-contrib-semistandard
# - SublimeLinter-contrib-standard
# - SublimeLinter-csslint
# - SublimeLinter-eslint
# - SublimeLinter-json

cd sublime/ "~/Library/Application\ Support/Sublime\ Text*/Packages/User/"

npm i -g \
	eslint \
	csslint \
	htmlhint \
	prettier \
	eslint-plugin-prettier \
	eslint-config-prettier \
	eslint-plugin-react

cat << EOF > ~/.eslintrc
{
  "plugins": ["prettier", "react"],
  "extends": [
    "eslint:recommended",
    "plugin:react/recommended",
    "plugin:prettier/recommended"
  ],
  "env": {
    "shared-node-browser": true,
    "mocha": true,
    "jest": true
  },
  "parserOptions": {
    "ecmaVersion": 2018,
    "sourceType": "module",
    "ecmaFeatures": { "jsx": true }
  }
}
EOF

cat << EOF > ~/.prettierrc
{
  "singleQuote": true
}
EOF



# Our custom cowsay figure, see cowsay -l
cp dakota.cow /usr/local/Cellar/cowsay/3.04/share/cows
