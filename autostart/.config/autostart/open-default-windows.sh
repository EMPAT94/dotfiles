#!/usr/bin/env bash
kitty & disown
sleep 1
xdotool set_desktop 6
brave "https://mail.google.com/mail/u/0/#inbox" "https://calendar.google.com/calendar/u/0/r" "https://tasksboard.com/app" > /dev/null 2>&1 & disown
