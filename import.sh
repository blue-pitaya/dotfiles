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

cp -v ~/.aliases $DOTFILES

# ranger
mkdir -p ${CONFIGDIR}/ranger/
cp -v ~/.config/ranger/rc.conf ${CONFIGDIR}/ranger

# nvim
mkdir -p ${CONFIGDIR}/nvim/
cp -v ~/.config/nvim/init.lua ${CONFIGDIR}/nvim
cp -rv ~/.config/nvim/lua/ ${CONFIGDIR}/nvim/
cp -rv ~/.config/nvim/snippets/ ${CONFIGDIR}/snippets/
cp -rv ~/.config/nvim/colors/ ${CONFIGDIR}/nvim/

# zathura
mkdir -p ${CONFIGDIR}/zathura/
cp -v ~/.config/zathura/zathurarc ${CONFIGDIR}/zathura

# cmus
mkdir -p $CONFIGDIR/cmus/
cp -v ~/.config/cmus/autosave $CONFIGDIR/cmus

#gtk
mkdir -p $CONFIGDIR/gtk-3.0/
cp -v ~/.config/gtk-3.0/settings.ini $CONFIGDIR/gtk-3.0

#htop
mkdir -p $CONFIGDIR/htop/
cp -v ~/.config/htop/htoprc $CONFIGDIR/htop

#sbt
mkdir -p ${DOTFILES}/.sbt/1.0/
cp -v ~/.sbt/1.0/global.sbt ${DOTFILES}/.sbt/1.0/
