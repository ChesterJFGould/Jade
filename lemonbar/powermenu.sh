#! /bin/sh

cd $(dirname $(realpath $0))/..

selection=$(echo 'logout\nreboot\nshutdown' | xmenu -p 0x20)

case "$selection" in
	'logout')
		delogout
		;;
	'reboot')
		sudo -A reboot
		;;
	'shutdown')
		sudo -A shutdown now
		;;
esac
