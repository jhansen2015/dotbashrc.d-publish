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
  local CYGPATHS
  local OFS="$IFS"
  IFS=$'\n' CYGPATHS=( `cygpath "${PATHS[@]}"` );
  IFS="$OFS"

  declare -A EXISTS=()

  local p
  for p in "${CYGPATHS[@]}"
  do
    if [[ ! -d "$p" ]]
    then
      echo "$L: WARNING: Ignoring non-existant path: [$p]" >&2
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

