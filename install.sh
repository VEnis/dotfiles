#!/bin/bash

function create_link {
  source=~/.dotfiles/$1
  target=~/$1
  echo "$source  --->  $target"

  ln -nfs $source $target
}

function install_vundle {
  vundle_path=~/.vim/bundle/vundle
  if [[ ! -d $vundle_path ]]
  then
    echo "INSTALL"
    git clone https://github.com/gmarik/vundle.git $vundle_path
    vim --noplugin -u ~/.vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
  fi
}

create_link .vim
create_link .vimrc
create_link .mc
install_vundle
