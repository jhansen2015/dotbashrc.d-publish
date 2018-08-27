#!/bin/bash

#
# Works in combination with zz_paths.sh
#

#
# Retain the original path so we can ". .bashrc" to
# refresh the path without opening a new shell.
#
if [[ ! -v PATH_ORIGINAL ]]
then
   export PATH_ORIGINAL="$PATH"
fi
# Reset path so other scripts have something to work with.
export PATH="$PATH_ORIGINAL"

#
# Create a PATHS array that paths can be appended to
# by other scripts, e.g.
# PATHS+=( "$HOME/bin-extra" )
#
# Set to empty to start so ". .bashrc" doesn't keep
# appending to the path.
PATHS=()

# Pre-populate with existing path entries
OFS="$IFS"
IFS=$'\n'
for p in `printf "${PATH//:/$IFS}"`
do
	PATHS+=( "$p" )
done
IFS="$OFS"
unset OFS EXISTS p

