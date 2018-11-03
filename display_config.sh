#! /bin/sh
# Set xrandr properly when a display is detected connected to the display port

main_display=LVDS-1
office_display=DP-2

outputs=`xrandr | grep " connected" | cut -d' ' -f1`

if echo $outputs | grep $office_display ; then
	xrandr --output $main_display --auto --left-of $office_display --rotate normal \
		   --output $office_display --auto --rotate normal
else
	xrandr --output $main_display --auto --rotate normal \
		   --output $office_display --off
fi
