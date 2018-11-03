#! /bin/bash
# Tweak my configuration to work better with my IBM model M Keyboard
# Useful instructions on how to use xmodmap:
# https://wiki.archlinux.org/index.php/xmodmap

# Configure right control to work as a window key
xmodmap -e "keycode  27 = r R r R egrave Egrave egrave"
xmodmap -e "clear control"
xmodmap -e "clear mod4"
xmodmap -e "add control = Control_L"
xmodmap -e "add mod4 = Super_L Super_R Hyper_L Control_R"
