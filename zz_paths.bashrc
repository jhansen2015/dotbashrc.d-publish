#!/bin/bash

#
# Works in combination with 00_paths.sh
#
if [[ -e /usr/bin/cygpath ]]
then
  CYG=1
fi
L="${BASH_SOURCE[0]}"
declare -A EXISTS=()
NEWPATH=""
for entry in "${PATHS[@]}"
do
  if [[ "1" == "$CYG" ]]
  then
    p="`cygpath "$entry"`"
  else
    p="$entry"
  fi
  if [[ ! -d "$p" ]]
  then
    echo "$L: WARNING: Ignoring non-existant path: [$entry]"
  elif [[ -v EXISTS["$p"] ]]
  then
    echo "$L: WARNING: Ignoring duplicate path: [$entry]"
  else
    NEWPATH="$NEWPATH:$p"
    EXISTS["$p"]=1
  fi
done
# Trim the first character and export
export PATH="${NEWPATH:1}"

# Clean up
unset EXISTS L NEWPATH entry p

