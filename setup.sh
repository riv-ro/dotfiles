#!/bin/bash

for file in .??*
do
    [[ "$file" == ".git" ]] && continue
    [[ "$file" == ".DS_Store" ]] && continue
    
    ln -s $HOME/dotfiles/$file $HOME/$file
done

