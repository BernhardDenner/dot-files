#!/bin/sh

# setup keyboard layout and custom mappings

# US layout, with altgr on right alt key
# 3rd level chooser is on rigth alt key
# capslock is an escape key
setxkbmap us altgr-intl lv3:ralt_switch caps:escape

# setup custom mapping
xmodmap ~/.Xmodmap
