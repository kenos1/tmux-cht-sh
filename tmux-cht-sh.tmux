#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/bin/helpers.sh"

main() {

    local win_width="$(get_tmux_option "@cht-sh-win-width" "80%")"
    local win_height="$(get_tmux_option "@cht-sh-win-height" "80%")"
    local trigger_key="$(get_tmux_option "@cht-sh-key" "S")"

    tmux bind-key "$trigger_key" run-shell "$CURRENT_DIR/bin/tmux_poup_func.sh cht $CURRENT_DIR/bin/tmux-cht-sh.sh $win_width,$win_height"
}

main

