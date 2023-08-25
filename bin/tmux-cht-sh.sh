#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if test -f "$CURRENT_DIR/cht.sh"; then
  CHTSH="$CURRENT_DIR/cht.sh"
else
  curl -Ss https://cht.sh/:cht.sh > "$CURRENT_DIR/cht.sh"
  chmod +x "$CURRENT_DIR/cht.sh"
  CHTSH="$CURRENT_DIR/cht.sh"
fi

if test -f "$CURRENT_DIR/list"; then
  LIST="$CURRENT_DIR/list"
else
  curl -Ss https://cht.sh/:list > "$CURRENT_DIR/list"
  LIST="$CURRENT_DIR/list"
fi

ITEM="$(cat $LIST | fzf --preview="bash $CHTSH {}" )"

if [ "$ITEM" == "" ]; then
  exit 0
fi

read -e -p "Query for $ITEM: " QUERY

QUERY="$(printf $QUERY | sed 's/\ /+/g')"

bash $CHTSH $ITEM $QUERY | $PAGER
