#!/bin/bash

# Set the history size to 10k
export HISTSIZE=10000

# Timestamp the bash history, and display in using ISO-8601 format
export HISTTIMEFORMAT="%Y-%m-%dT%T "

#
# Copied from Cygwin ~/.bashrc
#

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# History Options

# Don't put duplicate lines in the history.
export HISTCONTROL="$HISTCONTROL${HISTCONTROL+:}ignoreboth"

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls -al' # Ignore the ls command as well

# Preserve any existing prompt settings. Allows it to cooperate with bash_command_timer.
if [[ -n "$PROMPT_COMMAND" ]]; then
  PROMPT_COMMAND="$PROMPT_COMMAND;"
fi

# Coordinate with bash-command-timer; don't need to time additional history commands
if [[ "${PROMPT_COMMAND}" =~ .*BCTPostCommand.* ]]; then
  PROMPT_COMMAND="${PROMPT_COMMAND} BCT_ENABLE=0;"
fi

# Whenever displaying the prompt, write the previous line to disk
PROMPT_COMMAND="${PROMPT_COMMAND} history -a; history -n;"

# Coordinate with bash-command-timer
if [[ "${PROMPT_COMMAND}" =~ .*BCTPostCommand.* ]]; then
  PROMPT_COMMAND="${PROMPT_COMMAND} BCT_ENABLE=1; BCT_AT_PROMPT=1; "
fi
