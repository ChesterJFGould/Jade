#! /bin/sh

workingPath=$(dirname $(realpath $0))

$workingPath/st/build.sh
$workingPath/st/install.sh

$workingPath/wjt/build.sh
$workingPath/wjt/install.sh

$workingPath/xmenu/build.sh
$workingPath/xmenu/install.sh

$workingPath/dmenu/build.sh
$workingPath/dmenu/install.sh

$workingPath/herbe/build.sh
$workingPath/herbe/install.sh

$workingPath/tiramisu/build.sh
$workingPath/tiramisu/install.sh

$workingPath/lemonbar/build.sh
$workingPath/lemonbar/install.sh
