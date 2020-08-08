#!/bin/bash
set -e

DOT_DIRECTORY="${HOME}/dotfiles"
cd ${DOT_DIRECTORY}

# Detect OS test.
case "$(expr substr $(uname -s) 1 5)" in
  "Linux" )
    OS=Linux
    ;;
  "MINGW" ) 
    OS=MINGW
    ;;
  "Darwi" ) OS=Mac     ;; # Not tested.
  *)
    echo "Unknown OS"
    exit 1
    ;;
esac

echo ${OS}

# Restore the replaced from '.' to '_' filenames.
for v in _*
do
  ln -snfv --backup=nil ${DOT_DIRECTORY}/${v} ${HOME}/$(echo ${v} | sed "s/^\_/\./")
done

if [[ ${OS} == "MINGW" ]]; then
  ln -nfv --backup=nil ${DOT_DIRECTORY}/${f} ${HOME}/$(echo ${f} | sed "s/^${OS}//")
  cmd.exe /c "mklink /j ..\\Documents c:\\Users\\%USERNAME%\\Documents"
  cmd.exe /c "mklink /j ..\\Pictures c:\\Users\\%USERNAME%\\Pictures"
  cmd.exe /c "mklink /j ..\\Videos c:\\Users\\%USERNAME%\\Videos"
  cmd.exe /c "mklink /j ..\\Downloads c:\\Users\\%USERNAME%\\Downloads"
  cmd.exe /c "mklink /j ..\\Desktop c:\\Users\\%USERNAME%\\Desktop"
fi

curl -o ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
chmod a+x ~/.git-completion.bash
chmod a+x ~/.git-prompt.sh
