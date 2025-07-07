#!/bin/bash

# Show power menu using rofi
choice=$(printf " Power Off\n Reboot\n Suspend\n Logout" | rofi -dmenu -i -p "Power Menu" -theme drun)

case "$choice" in
    " Power Off") systemctl poweroff ;;
    " Reboot") systemctl reboot ;;
    " Suspend") systemctl suspend ;;
    " Logout") loginctl terminate-user "$USER" ;;
    *) exit 1 ;;
esac
