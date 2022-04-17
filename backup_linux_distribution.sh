#!/usr/bin/env bash

if [[ $# -eq 0 ]] ; then
    echo 'Give at least a directory destination.'
    exit 1
fi

dest="${1}"

sudo rsync -aAX --delete / \
--exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/swapfile","/lost+found","/home"} "$(pwd)/${dest}"
