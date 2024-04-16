#!/usr/bin/env bash

filesArr=(
  ".config/nvim"
  ".config/tmux"
  ".config/kitty"
  ".bash_aliases"
  ".bash_history"
  ".bash_logout"
  ".bashrc"
  ".fzf.zsh"
  ".gitconfig"
  ".gitconfig.gringo"
  ".npmrc"
  ".profile"
  ".tmux.conf"
  ".viminfo"
  ".vimrc"
  ".vimrc_backup"
  ".zprofile"
  ".zsh_history"
  ".zshrc"
)

for file in "${filesArr[@]}"
do
  fileLink="$(pwd)/$file"
  echo "Atualizando arquivo $fileLink"
  if [ -d $fileLink ]; then
    rm -rf ~/$file
  else
    rm -f ~/$file
  fi
  ln -s $fileLink ~/$file  # symlink files
  echo "Finished symlink $fileLink \n"
done

source ~/.zshrc
