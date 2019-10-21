#!/usr/bin/env bash

rm -rf .bash_profile .aliases .vimrc .gitconfig .npmrc .gitignore_global .hushlogin Vagrantfile .cowfiles .git-completion.bash .npm-completion.bash

cp .bash_profile $HOME/.bash_profile
cp .aliases $HOME/.aliases
cp .vimrc $HOME/.vimrc
cp .gitconfig $HOME/.gitconfig
cp .npmrc $HOME/.npmrc
cp .gitignore_global $HOME/.gitignore_global
cp .hushlogin $HOME/.hushlogin
cp Vagrantfile $HOME/Vagrantfile
cp -r .cowfiles $HOME/.cowfiles

cp .git-completion.bash $HOME/.git-completion.bash
npm completion > $HOME/.npm-completion.bash
