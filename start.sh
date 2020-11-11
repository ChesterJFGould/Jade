#! /bin/sh

workingPath=$(dirname $(realpath $0))
wm='bspwm'

getConfig() {
	grep "^$1 " $workingPath/config | cut -d' ' -f 1 --complement
}


#########################
# Environment Variables #
#########################
export PATH=$workingPath/bin:$PATH
export SUDO_ASKPASS=$workingPath/bin/askpass



#########
# Pywal #
#########
wal -i $workingPath/wallpapers
(cd $workingPath
if [ -f .wallpapermd5 ]; then
	md5sum --check .wallpapermd5 || ./build.sh
else
	./build.sh
fi)



############
# Lemonbar #
############
$workingPath/lemonbar/run.sh &



###########
# Compton #
###########
compton -b --config $workingPath/compton/picom.conf



#################
# Notifications #
#################
(tiramisu |\
stdbuf -oL grep -e '^summary:' -e '^body:' |\
stdbuf -oL sed 's/^summary: //g;s/^body: //g' |\
xargs -d'\n' -L 2 herbe) &



#########
# Sxhkd #
#########
sxhkdConfig=$(mktemp)
chmod +x $sxhkdConfig
cat $workingPath/sxhkd/sxhkdrc > $sxhkdConfig
case "$wm" in
	'bspwm')
		cat $workingPath/bspwm/sxhkdrc >> $sxhkdConfig
		;;
	'berry')
		cat $workingPath/berry/sxhkdrc >> $sxhkdConfig
		;;
esac
sxhkd -c $sxhkdConfig &



##################
# Window Manager #
##################
case "$wm" in
	'bspwm')
		echo "#! /bin/sh\nbspc quit" > $workingPath/bin/delogout
		chmod +x $workingPath/bin/delogout
		exec bspwm -c $workingPath/bspwm/bspwmrc
		;;
	'berry')
		echo "#! /bin/sh\nberryc quit" > $workingPath/bin/delogout
		chmod+x $workingPath/bin/delogout
		exec berry -c $workingPath/berry/autostart
		;;
esac
