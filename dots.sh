#!/bin/bash
set -e

DOT_DIRECTORY="${HOME}/dotfiles"
cd ${DOT_DIRECTORY}

# Restore the replaced from '.' to '_' filenames.
for f in _*
do
  ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/$(echo ${f} | sed "s/^\_/\./")
done
