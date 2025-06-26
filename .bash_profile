if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
if [ -x /usr/share/source-highlight/src-hilite-lesspipe.sh ]; then
  export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
  export LESS=' -R '
fi
export LESS='-R'
export DISPLAY=:0.0
export GOPATH=$HOME/work
export LANG=ja_JP.utf8
export EDITOR=vim
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
if [ -d $HOME/.cargo/bin ]; then
    export PATH=$PATH:$HOME/.cargo/bin
    source "$HOME/.cargo/env"
fi
