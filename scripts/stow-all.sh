#!/bin/zsh

for d in `ls ../configs/*`;
do 
	(stow --restow $d)
done	