#!/bin/bash

# Check perms.
SOURCE_DIR="${HOME}/.bashrc.d"
if [[ ! -d "$SOURCE_DIR" ]]
then
	unset SOURCE_DIR
	return
fi

# Example: drwxrwxrwx
PERMS="`stat -c "%A" "$SOURCE_DIR"`"
G_W="${PERMS:5:1}"
O_W="${PERMS:8:1}"
if [[ "$G_W" == "w" || "$O_W" == "w" ]]
then
	echo "SECURITY ERROR: Permissions of $SOURCE_DIR allow group and/or other to write.  Disable: chmod og-w $SOURCE_DIR"
	return
fi
unset PERMS G_W O_W

for f in "$SOURCE_DIR"/*.bashrc
do
	# Source the file
	# WARNING: This can trigger an exit.
	if [[ -x "$f" ]]
	then
		echo "Sourcing [$f]"
		. "$f" || echo "Problem executing [$f]"
	fi
done

unset SOURCE_DIR f
