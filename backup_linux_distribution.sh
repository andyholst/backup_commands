#!/usr/bin/env bash

sudo rsync -aAX --delete / \
--exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/swapfile","/lost+found","/home"} $(pwd)/manjaro
