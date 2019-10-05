#! /bin/bash

# Tweak my configuration to work better with my IBM model M Keyboard
# meant to be used with a US international layout

# Useful instructions on how to use xmodmap:
# https://wiki.archlinux.org/index.php/xmodmap

# Configure right control to work as a window key
xmodmap -e "remove control = Control_R"
xmodmap -e "add mod4 = Control_R"

# Fn keys to media keys
xmodmap -e "keycode  69 = XF86AudioLowerVolume XF86AudioLowerVolume F3 F3 F3 F3 XF86Switch_VT_3 F3 F3 XF86Switch_VT_3 F3 F3 F3 F3 XF86Switch_VT_3"
xmodmap -e "keycode  70 = XF86AudioRaiseVolume XF86AudioRaiseVolume F4 F4 F4 F4 XF86Switch_VT_4 F4 F4 XF86Switch_VT_4 F4 F4 F4 F4 XF86Switch_VT_4"
xmodmap -e "keycode  72 = XF86AudioPlay XF86AudioPlay F6 F6 F6 F6 XF86Switch_VT_6 F6 F6 XF86Switch_VT_6 F6 F6 F6 F6 XF86Switch_VT_6"
xmodmap -e "keycode  73 = XF86AudioNext XF86AudioNext F7 F7 F7 F7 XF86Switch_VT_7 F7 F7 XF86Switch_VT_7 F7 F7 F7 F7 XF86Switch_VT_7"
xmodmap -e "keycode  74 = XF86AudioPrev XF86AudioPrev F8 F8 F8 F8 XF86Switch_VT_8 F8 F8 XF86Switch_VT_8 F8 F8 F8 F8 XF86Switch_VT_8"

# Alternative Graphics
xmodmap -e "keycode  38 = a A a A agrave Agrave agrave"
xmodmap -e "keycode  26 = e E e E egrave Egrave egrave"
xmodmap -e "keycode  31 = i I i I igrave Igrave igrave"
xmodmap -e "keycode  32 = o O o O ograve Ograve ograve"
xmodmap -e "keycode  30 = u U u U ugrave Ugrave ugrave"
