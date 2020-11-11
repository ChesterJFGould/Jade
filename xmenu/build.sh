#! /bin/sh

workingDir=$(dirname $(realpath $0))

getConfig() {
	grep "^$1 " $workingDir/config | cut -d' ' -f 1 --complement
}

cd $workingDir/src

ls -1 $workingDir/patches |\
xargs -P 1 -I{} sh -c 'patch -N -p1 < ../patches/{}'

. $HOME/.cache/wal/colors.sh

echo "
#define NORM_FG_COLOR \"$foreground\"
#define NORM_BG_COLOR \"$background\"
#define SEL_BG_COLOR \"$color1\"
#define SEL_FG_COLOR \"$foreground\"
#define FONT \"$(getConfig font)\"
#define MIN_WIDTH $(getConfig min_width)
#define ENTRY_HEIGHT $(getConfig entry_height)
#define BORDER_WIDTH $(getConfig border_width)
#define SEPARATOR_WIDTH $(getConfig separator_width)
#define MENU_GAP $(getConfig menu_gap)
#define ICON_PADDING $(getConfig icon_padding)
#define HORIZONTAL_PADDING $(getConfig horizontal_padding)
#define TRIANGLE_WIDTH $(getConfig triangle_width)
#define TRIANGLE_HEIGHT $(getConfig triangle_height)
" > config.gen.h

make clean

make
