#! /bin/sh

workingDir=$(dirname $(realpath $0))

rm $workingDir/../bin/xmenu

cp $workingDir/src/xmenu $workingDir/../bin/xmenu
