#!/bin/bash

echo "Choose one of the options below:"
echo "Option 1: basic install"
echo "vim, terminator, tmux"
echo

echo "Option 2: graphic editing"
echo "vim, terminator, tmux, inkscape, gimp"
echo

echo "Still more options need to be added"

echo "Waiting input: 1 or 2"
read option

if [ 1 -eq $option ]; then
	echo "You chose option 1: basic install"
	sudo apt install -y vim terminator tmux
else
	echo "You chose option 2: graphic editing" 
fi


