#! /bin/sh

workingPath=$(dirname $(realpath $0))

echo "
[Desktop Entry]
Name=jade
Comment=The Jade Desktop Environment
Exec=$workingPath/start.sh
Type=Application
" > $workingPath/jade.desktop
