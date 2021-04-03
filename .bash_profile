if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export LESS='-R'
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export DISPLAY=:1.0
export GOPATH=$HOME/work
export LANG=ja_JP.utf8
export EDITOR=vim
if [ -e $HOME/.cargo/bin ]; then
  export PATH=$PATH:$HOME/.cargo/bin
fi

