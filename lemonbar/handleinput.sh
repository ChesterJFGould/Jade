#! /bin/sh

case "$1" in
	'power')
		lemonbar/powermenu.sh
		;;
	'search')
		dmenu_run
		;;
	'network')
		networkmanager_dmenu
		;;
	'volume')
		wjt -x $(pamixer --get-volume) |\
		xargs -I{} pamixer --set-volume {}
		;;
	'volume up')
		pamixer -i 1
		;;
	'volume down')
		pamixer -d 1
		;;
esac
