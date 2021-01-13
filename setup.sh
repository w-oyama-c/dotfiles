#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

echo "Setup vimfiles..."
echo

read -p "Setup vim general settings? (Y/n) " ans
case $ans in
  "" | [Yy]* )
    mkdir ~/.vim
    ln -siv $SCRIPT_DIR/.vimrc ~/.vimrc
    ln -siv $SCRIPT_DIR/.vim/colors/ ~/.vim/
    mkdir -p ~/.vim/backup
    mkdir -p ~/.vim/undo

    echo
    echo -n "Add .gvimrc to \"$HOME\" ? (y/N) "
    read ans
    case $ans in
      [Yy]* )
        ln -siv $SCRIPT_DIR/.gvimrc ~/.gvimrc
        ;;
      * )
    esac

    echo
    ;;
  * )
esac

read -p "Setup vim syntax override files? (Y/n) " ans
case $ans in
  "" | [Yy]* )
    ln -siv $SCRIPT_DIR/.vim/after/ ~/.vim/

    echo
    ;;
  * )
esac

read -p "Setup vim plugin files and plugin manager(dein)? (Y/n) " ans
case $ans in
  "" | [Yy]* )
    mkdir -p ~/.vim/dein
    ln -siv $SCRIPT_DIR/.vim/dein/dein.toml ~/.vim/dein/dein.toml
    ln -siv $SCRIPT_DIR/.vim/dein/dein_lazy.toml ~/.vim/dein/dein_lazy.toml
    ln -siv $SCRIPT_DIR/.vim/pluginrc/ ~/.vim/

    echo
    ;;
  * )
esac

read -p "Add other dotfiles to \"$HOME\" ? (Y/n) " ans
case $ans in
  "" | [Yy]* )
    ln -siv $SCRIPT_DIR/.git-commit-template ~/.git-commit-template
    ln -siv $SCRIPT_DIR/.gitconfig ~/.gitconfig
    ln -siv $SCRIPT_DIR/gitignore ~/.gitignore
    ln -siv $SCRIPT_DIR/.p10k.zsh ~/.p10k.zsh
    ln -siv $SCRIPT_DIR/.profile ~/.profile
    ln -siv $SCRIPT_DIR/.zprofile ~/.zprofile
    ln -siv $SCRIPT_DIR/.zshrc ~/.zshrc

    echo
    ;;
  * )
esac

read -p "Add any useful windows-commands aliases to \"/usr/local/bin\" ? (Y/n) " ans
case $ans in
  "" | [Yy]* )
    sudo ln -siv /mnt/c/Windows/System32/clip.exe /usr/local/bin/clip
    sudo ln -siv /mnt/c/Windows/explorer.exe /usr/local/bin/explorer

    echo
    ;;
  * )
esac


echo
echo "Done."
exit 0
