#! /bin/sh

workingDir=$(dirname $(realpath $0))

rm $workingDir/../bin/tiramisu

cp $workingDir/src/tiramisu $workingDir/../bin/tiramisu
