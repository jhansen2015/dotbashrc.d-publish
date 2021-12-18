#!/bin/bash

# If no PATHS array, use current path
if [[ 0 -eq ${#PATHS[*]} ]]; then
  OFS="$IFS"
  IFS=$'\n' PATHS=( `printf "${PATH//:/$IFS}"` )
  IFS="$OFS"
  unset OFS
fi

#
# Works in combination with 00_paths.sh
#
function __construct_path_cbe6d98d444d484fa6c2937abc28622d() {
  local L="${BASH_SOURCE[0]}"

  # associative arrays are local by default
  local NEWPATHS=( "${PATHS[@]}" )

  if [[ -e /usr/bin/cygpath ]]
  then
    # For speed, convert all paths in a single cygpath call
    local OFS="$IFS"
    IFS=$'\n' NEWPATHS=( `cygpath "${PATHS[@]}"` );
    IFS="$OFS"
  fi

  declare -A EXISTS=()

  local p
  for p in "${NEWPATHS[@]}"
  do
    if [[ ! -d "$p" ]]
    then
      echo "$L: WARNING: Ignoring non-existant path: [$p]"
    elif [[ -v EXISTS["$p"] ]]
    then
      echo "$L: WARNING: Ignoring duplicate path: [$p]"
    else
      local NEWPATH="$NEWPATH:$p"
      EXISTS["$p"]=1
    fi
  done

  # Trim the first character and export
  export PATH="${NEWPATH:1}"
}

__construct_path_cbe6d98d444d484fa6c2937abc28622d
unset __construct_path_cbe6d98d444d484fa6c2937abc28622d

