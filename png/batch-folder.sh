#!/bin/bash
path=${1:-"."} #directory to start
howmany=${2:-20} #partition size
pushd $path; #move there
part=1; #starting partition
LIST="/usr/bin/find -maxdepth 1 -type f" #move only files?
#LIST="ls" #move everything #be careful, $folder will get moved also :-)
count=`$LIST |/usr/bin/wc -l`; #count of files to move
while [ $count -gt 0 ]; do
    folder="folder-$part";
    if [ ! -d $folder ]; then /usr/bin/mkdir -p $folder; fi
    /usr/bin/mv `$LIST |/usr/bin/sort |/usr/bin/head -$howmany` $folder/.
    count=`$LIST |/usr/bin/wc -l`; #are there more files?
    part=$(expr $part + 1)
done
popd $path
