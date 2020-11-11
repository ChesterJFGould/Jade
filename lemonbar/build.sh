#! /bin/sh

workingDir=$(dirname $(realpath $0))

cd $workingDir/src

make clean

make
