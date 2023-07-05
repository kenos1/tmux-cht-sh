#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ITEM="$(curl -s https://cheat.sh/:list | fzf)"
read -e -p "Query for $ITEM: " QUERY
QUERY="$(printf $QUERY | sed 's/\ /+/g')"

curl -s "https://cht.sh/$ITEM/$QUERY" | $PAGER