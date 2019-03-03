#!/bin/bash
set -e

DOT_DIRECTORY="${HOME}/dotfiles"
cd ${DOT_DIRECTORY}

# Restore the replaced from '.' to '_' filenames.
for v in _*
do
  ln -snfv ${DOT_DIRECTORY}/${v} ${HOME}/$(echo ${v} | sed "s/^\_/\./")
done

# Detect OS test.
case "$(expr substr $(uname -s) 1 5)" in
  "Linux" ) OS=Linux   ;;
  "MINGW" ) OS=MINGW   ;;
  "Darwi" ) OS=Mac     ;; # Not tested.
  *)        OS=Unknown ;;
esac

for f in *.*
do
  if [ $(expr substr ${f} 1 5) = ${OS} ]; then
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/$(echo ${f} | sed "s/^${OS}//")
  fi
done
