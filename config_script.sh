#!/bin/bash

cd ~/Documents/code/

repos=("git@github.com:tobymac208/ContactsAreNecessary.git"
	"git@github.com:tobymac208/YouTubeTutorials.git"
	"git@github.com:tobymac208/free-programming-books.git"
	"git@github.com:tobymac208/BlogIt.git"
	"git@github.com:tobymac208/Study-Timer.git"
	"git@github.com:tobymac208/ContactsAreNecessary.git")
for repo in ${repos[@]}; do
	git clone $repo
done

echo "Cloning has been completed."

echo "If you'd like anything else done, please modify this script. Enjoy!"
