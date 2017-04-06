#!/bin/bash
#
# install to ~/bin by default
#
me=$(readlink -f "$0")
mydir=$(dirname "$me")

INSTALL_DEST=~/bin
EXE=move-to-next-monitor

if [[ ! -d "$INSTALL_DEST" ]]
then
  mkdir "$INSTALL_DEST"
fi

# bash is here for testing the loop
checks="
xdotool
bash
wmctrl
"

# array
missing=()

for t in $checks
do
  if ! type  $t  > /dev/null 2>&1
  then
    missing+=( $t )
  fi
done
unset t


for m in ${missing[@]}
do
  echo "$m is missing"
  sudo apt install $m
done

cd $INSTALL_DEST
if [[ -e "$EXE" ]]
then
  echo "already exists '$EXE' in '$INSTALL_DEST'"
else
  # symlink to the depot
  ln -s "$mydir/$EXE" $EXE
fi
