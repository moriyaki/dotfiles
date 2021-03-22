#!/bin/bash
set -e

DOT_DIRECTORY="${HOME}/dotfiles"
cd ${DOT_DIRECTORY}

echo ${OS}

echo "start setup..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    ln -snfv ~/dotfiles/"$f" ~/
done

if [[ ${OS} == "MINGW" ]]; then
  ln -nfv --backup=nil ${DOT_DIRECTORY}/${f} ${HOME}/$(echo ${f} | sed "s/^${OS}//")
  cmd.exe /c "mklink /j ..\\Documents c:\\Users\\%USERNAME%\\Documents"
  cmd.exe /c "mklink /j ..\\Pictures c:\\Users\\%USERNAME%\\Pictures"
  cmd.exe /c "mklink /j ..\\Videos c:\\Users\\%USERNAME%\\Videos"
  cmd.exe /c "mklink /j ..\\Downloads c:\\Users\\%USERNAME%\\Downloads"
  cmd.exe /c "mklink /j ..\\Desktop c:\\Users\\%USERNAME%\\Desktop"
fi

if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then \
  echo "wsl"
  ln -s /mnt/c/Users/moriyaki ~/Home
  ln -s ~/Home/Desktop ~/Desktop
  ln -s ~/Home/Documents ~/Documents
  ln -s ~/Home/Downloads ~/Downloads
  ln -s ~/Home/Pictures ~/Pictures
  ln -s ~/Home/Videos ~/Videos
  ln -s ~/Home/Dropbox ~/Dropbox
  ln -s ~/Home/OneDrive ~/OneDrive
fi

curl -o ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
chmod a+x ~/.git-completion.bash
chmod a+x ~/.git-prompt.sh
