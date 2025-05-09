#!/bin/bash

case "$1" in
  --area)
    grim -g "$(slurp -w 0)" - | swappy -f -
    ;;
  --full)
    GRIM_DEFAULT_DIR=$HOME/Pictures/Screenshots grim && dunstify "Screenshot taken"
    ;;
  *)
    echo "Usage: $0 [--area | --full]"
    exit 1
    ;;
esac
