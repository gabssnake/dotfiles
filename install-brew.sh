#!/usr/bin/env bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	# Install brew
	sudo apt-get install build-essential
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >>~/.bash_profile
	brew install hello
	brew install gcc
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
	# Install brew
	xcode-select --install
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install hello
fi
