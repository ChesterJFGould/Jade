#! /bin/sh

workingDir=$(dirname $(realpath $0))

rm $workingDir/../bin/herbe

cp $workingDir/src/herbe $workingDir/../bin/herbe
