#!/bin/bash
set -e

DOT_DIRECTORY="${HOME}/dotfiles"
cd ${DOT_DIRECTORY}

# Detect OS test.
case "$(expr substr $(uname -s) 1 5)" in
  "Linux" )
    if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
      OS=WSL
    else
      OS=Linux
    fi
    ;;
  "MINGW" ) OS=MINGW   ;;
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
  ln -snfv ${DOT_DIRECTORY}/${v} ${HOME}/$(echo ${v} | sed "s/^\_/\./")
done

for f in *.*
do
  if [ $(expr substr ${f} 1 5) = ${OS} ]; then
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/$(echo ${f} | sed "s/^${OS}//")
  fi
done
