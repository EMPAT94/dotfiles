#!/usr/bin/env bash

# kitty --start-as=maximized --name=bpytop bpytop & disown
# sleep 1
# xdotool set_desktop_for_window $(xdotool search "bpytop") 8 > /dev/null

# kitty --start-as=maximized --name=mocp mocp & disown
# sleep 1
# xdotool set_desktop_for_window $(xdotool search "mocp") 7 > /dev/null

kitty --start-as=maximized --name=wiki nvim -S ~/MEGASync/wiki.vim & disown
sleep 1
xdotool set_desktop_for_window $(xdotool search "wiki") 7 > /dev/null

kitty --start-as=maximized --name=agenda nvim -S ~/MEGASync/agenda.vim & disown
sleep 1
xdotool set_desktop_for_window $(xdotool search "agenda") 6 > /dev/null

firefox > /dev/null 2>&1 & disown
