#!/bin/sh

DOTFILES="dotfiles"
MYSCRIPTS="scripts"
CONFIGDIR="${DOTFILES}/.config"

rm -rvf $DOTFILES
mkdir $DOTFILES
rm -rvf $MYSCRIPTS

# my scripts
cp -rv ~/${MYSCRIPTS} .

# zsh, io, xorg and other config files
cp -v ~/.zshrc $DOTFILES
cp -v ~/.zprofile $DOTFILES
cp -v ~/.inputrc $DOTFILES
cp -v ~/.xbindkeysrc $DOTFILES
cp -v ~/.xinitrc $DOTFILES

# ranger
mkdir -p ${CONFIGDIR}/ranger/
cp -v ~/.config/ranger/rc.conf ${CONFIGDIR}/ranger

# nvim
mkdir -p ${CONFIGDIR}/nvim/
cp -v ~/.config/nvim/init.vim ${CONFIGDIR}/nvim
mkdir -p ${CONFIGDIR}/nvim/lua
cp -rv ~/.config/nvim/lua/ ${CONFIGDIR}/nvim/lua
mkdir -p ${CONFIGDIR}/nvim/vsnip
cp -rv ~/.config/nvim/vsnip/ ${CONFIGDIR}/nvim/vsnip
