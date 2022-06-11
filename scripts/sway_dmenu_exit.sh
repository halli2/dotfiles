#!/usr/bin/env sh
# https://github.com/Madic-/Sway-DE/blob/master/bin/dmenupower.sh
case "$(echo -e " Exit sway\n Lock\n Power Off\n Reboot\n⏲ Suspend\n" | dmenu -l 5 -p "Power:")" in
" Exit sway")
  swaymsg exit
  loginctl terminate-user $USER
  ;;
" Lock") swaylock -f -c 000000 ;;
" Power Off") exec systemctl poweroff -i ;;
" Reboot") exec systemctl reboot ;;
"⏲ Suspend") exec systemclt suspend ;;
# Hibernate not supported on fedora atm
#"⏲ Suspend then hibernate") exec systemctl suspend-then-hibernate ;;
esac