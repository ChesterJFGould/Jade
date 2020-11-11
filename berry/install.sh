#! /bin/sh

workingDir=$(dirname $(realpath $0))

rm $workingDir/../bin/berry $workingDir/../bin/berryc

cp $workingDir/src/berry $workingDir/../bin/berry
cp $workingDir/src/berryc $workingDir/../bin/berryc
