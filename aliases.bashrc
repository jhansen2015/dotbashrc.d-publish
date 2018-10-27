#!/bin/bash

# Originally copied from Cygwin's default .bashrc, which has the 
# following header:
###########################################################################
#
# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
#
# base-files version 4.2-4
#
# ~/.bashrc: executed by bash(1) for interactive shells.
#
# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc
#
#
###########################################################################
#
# All changes and additions are contributed to the public domain 
# and distributed in the same manner:
###########################################################################
# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
###########################################################################

# Some people use a different file for aliases
if [ -f "${HOME}/.bash_aliases" ]
then
  source "${HOME}/.bash_aliases"
fi

return 0
