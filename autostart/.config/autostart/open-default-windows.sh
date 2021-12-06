#!/usr/bin/env bash

kitty --start-as=maximized --name=wiki nvim -S ~/MEGASync/wiki.vim & disown
sleep 1
xdotool set_desktop_for_window $(xdotool search "wiki") 7 > /dev/null

kitty --start-as=maximized --name=agenda nvim -S ~/MEGASync/agenda.vim & disown
sleep 1
xdotool set_desktop_for_window $(xdotool search "agenda") 6 > /dev/null

firefox "https://mail.google.com/mail/u/0/#inbox" "https://calendar.google.com/calendar/u/0/r" "https://tasksboard.com/app" > /dev/null 2>&1 & disown
