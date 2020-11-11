#! /bin/sh

workingDir=$(dirname $(realpath $0))

rm $workingDir/../bin/st

cp $workingDir/src/st $workingDir/../bin/st
