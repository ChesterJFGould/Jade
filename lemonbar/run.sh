#! /bin/sh
cd $(dirname $(realpath $0))
cd ..

. ~/.cache/wal/colors.sh

while true; do
	echo -n '%{l}'
	echo -n '%{A:power:} %{A}'
	echo -n '%{c}'
	echo -n $(date +%H:%M)
	echo -n '%{r}'
	echo -n '%{A:volume:}%{A4:volume up:}%{A5:volume down:}  %{A}%{A}%{A}'
	echo -n '%{A:network:}  %{A}'
	echo -n '%{A:search:}  %{A}'
	echo
	sleep 5
done | \
lemonbar -p -g x20 -B "$background" -F "$foreground" -f "LiterationSans Nerd Font:pixelsize=14:antialias=true:autohint=true" | \
xargs -I {} lemonbar/handleinput.sh '{}'
