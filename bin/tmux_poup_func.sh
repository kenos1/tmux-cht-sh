#!/usr/bin/env bash

##############################################################################################################
# Usage:                                                                                                     #
#                                                                                                            #
# tmux_poup_func.sh [ popup_session ] [ execution_shell ] [ windows_attributes ]                             #
#                                                                                                            #
# Parameters:                                                                                                #
#                                                                                                            #
# pram1 ( optional ): [ session_name ] a string. be set `func_popup` if being ''                             #
# pram2 ( optional ): [ shell_cmd ]                                                                          #
# pram3 ( optional ): [ width,height ] numbers splited with commas, can be percent. be set `95%` if being '' #
##############################################################################################################


####################
# Define variables #
####################
 
DEFAULT_WH="85%"
work_dir=$(tmux display-message -p -F '#{pane_current_path}')
s_name=${1:-'func_popup'}
fun_action="$2"
# Get width and height
if [[ -z $3 ]]; then
    width=$DEFAULT_WH
    height=$DEFAULT_WH
else
    while IFS=',' read -ra W_H; do
        if [[ ${#W_H[@]} -eq 1  ]]; then
            width="${W_H[0]:-$DEFAULT_WH}"
            height="${W_H[0]:-$DEFAULT_WH}"
        elif [[ ${#W_H[@]} -gt 1  ]]; then
            width="${W_H[0]:-$DEFAULT_WH}"
            height="${W_H[1]:-$DEFAULT_WH}"
        fi
    done <<< "$3"
fi


################################
# Open tmux session with popup #
################################

if [ "$(tmux display-message -p -F "#{session_name}")" = $s_name ];then
    tmux detach-client
else
    tmux has-session -t "$s_name"
    # Execute shell action only when no session.
    if [[ $? != 0 && ! -z $fun_action ]]; then
        # execute action
        tmux popup -d '#{pane_current_path}' -xC -yC -w$width -h$height -E "tmux attach -t $s_name \; send '$fun_action ; exit' ENTER || tmux new -s $s_name '$fun_action'"
    else
        # Attach or create session
        tmux popup -d '#{pane_current_path}' -xC -yC -w$width -h$height -E "tmux attach -t $s_name || tmux new -s $s_name"
    fi
fi

