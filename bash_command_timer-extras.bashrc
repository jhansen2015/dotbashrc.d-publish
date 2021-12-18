#!/bin/bash

export BCT_TIME_FORMAT='%Y-%m-%d %H:%M:%S'

# Bash command timer uses the COLUMNS var

# COLUMNS is not available by default at login on Cygwin
# https://stackoverflow.com/a/48016366/3192118
shopt -s checkwinsize

# Bash will automatically set COLUMNS to the current terminal width.
export COLUMNS

