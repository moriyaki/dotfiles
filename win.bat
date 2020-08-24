@echo off
mklink /J %HOME%\vimfiles\vimrc %HOME%\dotfiles\_vimrc
mklink /J %HOME%\vimfiles\gvimrc %HOME%\dotfiles\_gvimrc
mklink /J %HOME%\.vimrc %HOME%\dotfiles\_vimrc
mklink /J %HOME%\.gvimrc %HOME%\dotfiles\_gvimrc
