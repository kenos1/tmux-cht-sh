#!/usr/bin/env bash

#############################################
# param1 ( required ): option key           #
# param2 ( optional ): option value #
#############################################
set_tmux_option() {
  local option=$1
  local value=$2
  tmux set-option -gq "$option" "$value"
}

#############################################
# param1 ( required ): option key           #
# param2 ( optional ): option default value #
#############################################
get_tmux_option() {
  local option="$1"
  local default_value="$2"
  local option_value="$(tmux show-option -qv "$option")"
  if [ -z "$option_value" ]; then
    option_value="$(tmux show-option -gqv "$option")"
  fi
  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}
