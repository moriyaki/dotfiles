rem @echo off
mklink /h %HOMEPATH%\vimfiles\vimrc %HOMEPATH%\dotfiles\_vimrc
mklink /h %HOMEPATH%\vimfiles\gvimrc %HOMEPATH%\dotfiles\_gvimrc
mklink /h %HOMEPATH%\.vimrc %HOMEPATH%\dotfiles\_vimrc
mklink /h %HOMEPATH%\.gvimrc %HOMEPATH%\dotfiles\_gvimrc
