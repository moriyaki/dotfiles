#!/bin/bash

# Detect OS test.
case "$(expr substr $(uname -s) 1 5)" in
  "Linux" ) OS=Linux   ;;
  "MINGW" ) OS=MinGW   ;;
  "Darwi" ) OS=Mac     ;; # Not tested.
  *)        OS=Unknown ;;
esac

for f in *.*
do
  if [ $(expr substr ${f} 1 5) = ${OS} ]; then
    echo ${f} | sed "s/^${OS}//"
  fi
done
