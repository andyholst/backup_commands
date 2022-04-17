#!/usr/bin/env bash

if [ $# -lt 2 ] ; then
	echo 'You need to provide an source and a destination where to restore the Linux distribution of your choice'
    exit 1
fi

restoreSource="${1}"
restoreDestination="${2}"

sudo rsync -aAX --delete --exclude={"/lost+found","/home"} "${restoreSource}" "${restoreDestination}"

