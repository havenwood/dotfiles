#!/bin/bash

cd "$(dirname "$0")"
git pull

DIR=`pwd`
function install_dotfiles() {
	for file in .{aliases,bash_profile,bash_prompt,bashrc,box_name,exports,functions,gitattributes,gitconfig,gitignore,hushlogin,wgetrc,scripts}; do
		if [ -f "$file" ]; then
			rm ~/$file
			ln -s $DIR/$file ~/$file
		fi
	done
	unset file
	unset dir
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	install_dotfiles
else
	read -p "This will override files in your home directory. Are you sure?"
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		install_dotfiles
	fi
fi
unset install_dotfiles
unset install_homebrew
source ~/.bash_profile