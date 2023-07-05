#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if test -f "$CURRENT_DIR/cht.sh"; then
  CHTSH="$CURRENT_DIR/cht.sh"
else
  curl https://cht.sh/:cht.sh > "$CURRENT_DIR/cht.sh"
  chmod +x "$CURRENT_DIR/cht.sh"
  CHTSH="$CURRENT_DIR/cht.sh"
fi

ITEM="$(curl -s https://cheat.sh/:list | fzf)"

if [ "$ITEM" == "" ]; then
  exit 0
fi

read -e -p "Query for $ITEM: " QUERY

if [ "$QUERY" == "" ]; then
  printf "\e[31mPlease enter a query!\e[0m\n\e[5mPress any key to exit\e[0m"
  read -e -n 1
  exit 0
fi

QUERY="$(printf $QUERY | sed 's/\ /+/g')"

bash $CHTSH $ITEM $QUERY | $PAGER