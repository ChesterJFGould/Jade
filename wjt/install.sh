#! /bin/sh

workingDir=$(dirname $(realpath $0))

rm $workingDir/../bin/wjt

cp $workingDir/src/wjt $workingDir/../bin/wjt
