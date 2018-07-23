#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function execute() {
	rsync --exclude ".git/" \
	    --exclude ".gitignore" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "install.sh" \
		--exclude "modules/*" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

execute;
