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
cp -rv ~/.config/nvim/lua/ ${CONFIGDIR}/nvim/
cp -rv ~/.config/nvim/vsnip/ ${CONFIGDIR}/nvim/
cp -rv ~/.config/nvim/colors/ ${CONFIGDIR}/nvim/

# zathura
mkdir -p ${CONFIGDIR}/zathura/
cp -v ~/.config/zathura/zathurarc ${CONFIGDIR}/zathura
