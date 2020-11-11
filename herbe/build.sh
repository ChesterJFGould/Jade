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
static const char *background_color = \"$background\";
static const char *border_color = \"$color1\";
static const char *font_color = \"$foreground\";
static const char *font_pattern = \"$(getConfig font)\";
static const unsigned line_spacing = $(getConfig line_spacing);
static const unsigned int padding = $(getConfig padding);
static const unsigned int width = $(getConfig width);
static const unsigned int border_size = $(getConfig border_width);
static const unsigned int pos_x = $(getConfig x_position);
static const unsigned int pos_y = $(getConfig y_position);
static const unsigned int duration = $(getConfig duration);
" > config.gen.h

make clean

make
