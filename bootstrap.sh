#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "install.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	mkLogDir;
	install;
}

function mkLogDir() {
	sudo mkdir -p /var/log
}

function install() {
	chmod +x install.sh
	./install.sh 2>&1 /var/log/bootstrap
}

if [[ "$1" == "--force" || "$1" == "-f" ]]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;

unset doIt;
unset mkLogDir;
unset install;
