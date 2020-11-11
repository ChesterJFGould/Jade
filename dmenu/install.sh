#! /bin/sh

workingDir=$(dirname $(realpath $0))

rm $workingDir/../bin/dmenu \
$workingDir/../bin/dmenu_path \
$workingDir/../bin/dmenu_run

cp $workingDir/src/dmenu $workingDir/../bin/dmenu
cp $workingDir/src/dmenu_path $workingDir/../bin/dmenu_path
cp $workingDir/src/dmenu_run $workingDir/../bin/dmenu_run
