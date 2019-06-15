#/bin/bash
# https://www.reddit.com/r/i3wm/comments/6580vm/how_to_set_multiple_monitors_to_use_the_same/
# feh has a randomize flag but if you have multiple screen it assign a different wallpaper to each screen.
WALLPAPER_DIR=$1
WALL=$(find "$WALLPAPER_DIR" -type f | sort -R | tail -1)
feh --no-fehbg --bg-fill "$WALL"
