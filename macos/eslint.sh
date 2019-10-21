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
