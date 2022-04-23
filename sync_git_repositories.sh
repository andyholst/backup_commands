#!/usr/bin/env bash

##############################################
# Sync git repositories from current directory
##############################################

ls -d */ | xargs -I{} bash -c 'git -C {} rev-parse --show-toplevel && git -C {} rev-parse --abbrev-ref HEAD \
	&& echo " Fetching. " && git -C {} fetch --all'
ls -d */ | xargs -I{} bash -c 'git -C {} rev-parse --show-toplevel && git -C {} rev-parse --abbrev-ref HEAD \
	&& echo " Setting origin main branch to $(git -C {} remote set-head origin --auto). " && git -C {} remote set-head origin --auto'
ls -d */ | xargs -I{} bash -c 'git -C {} rev-parse --show-toplevel && git -C {} rev-parse --abbrev-ref HEAD \
	&& echo " Checking out $(git -C {} rev-parse --abbrev-ref origin/HEAD). " \
	&& git -C {} checkout $(git -C {} rev-parse --abbrev-ref origin/HEAD | sed s:origin/::)'
ls -d */ | xargs -I{} bash -c 'git -C {} rev-parse --show-toplevel && git -C {} rev-parse --abbrev-ref HEAD \
	&& echo " Pruning obsolete branches. " && git -C {} fetch --prune'
ls -d */ | xargs -I{} bash -c 'git -C {} rev-parse --show-toplevel && git -C {} rev-parse --abbrev-ref HEAD \
	&& echo " Pulling from origin $(git -C {} rev-parse --abbrev-ref origin/HEAD). " \
	&& git -C {} pull origin $(git -C {} branch --show-current)'
