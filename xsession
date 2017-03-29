#!/usr/bin/env bash

xsetroot -solid black &
xset m 3/2 5
xset s 600 600
xscreensaver -no-splash &
unclutter -idle 10 &

sleep 2

xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "add mod3 = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Super_L"
xmodmap -e "add mod3 = Super_L"

#/home/jkeen/bin/fix_res

xrandr --output DFP5 --output DFP13 --primary --left-of DFP5

xmonad | tclsh ~/bin/dzen_filter.tcl | dzen2 -e '' -ta l -fn -*-clean-medium-r-*-*-*-120-*-*-*-*-*- 
