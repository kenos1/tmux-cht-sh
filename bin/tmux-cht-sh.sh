#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
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

curl -s "https://cht.sh/$ITEM/$QUERY" | $PAGER