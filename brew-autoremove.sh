#!/usr/bin/env bash

declare -A visited_formulas

visited_formulas["brew cask"]=1

check_formulas () {
    for formula in "$@"; do
	dependees=$(brew uses --installed $formula)
	if [ -z "$dependees" ] && [ ! ${visited_formulas[$formula ]+isset} ]; then
	    read -p "$formula is not depended on by other formulas. Remove? [Y/n] " -n 1 -r
	    echo
            visited_formulas[$formula]=1
	    if [[ $REPLY =~ ^[Yy]$ ]]
	    then
	        echo "Removing $formula..."
		brew remove $formula
		check_formulas `brew deps --1 --installed $formula`
	    fi
	fi
    done
}

check_formulas `brew list`
