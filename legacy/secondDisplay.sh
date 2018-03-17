#!/bin/sh

# Configure external display

xrandr --output LVDS --mode 1024x600
xrandr --output HDMI-0 --mode 1920x1080 --right-of LVDS
