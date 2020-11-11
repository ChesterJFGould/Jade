#! /bin/sh

workingDir=$(dirname $(realpath $0))

rm $workingDir/../bin/lemonbar

cp $workingDir/src/lemonbar $workingDir/../bin/lemonbar
