#!/bin/zsh
# for d in `ls *`;
# do 
# 	(stow --restow $d)
# done	

stow -R i3 -vvv
stow -R kitty
stow -R polybar 