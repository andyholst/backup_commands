#!/usr/bin/env bash

##############################################
# Sync git repositories from current directory
##############################################

ls -d */ | xargs -I{} git -C {} fetch --all
ls -d */ | xargs -I{} git -C {} checkout $(git remote set-head origin --auto >/dev/null 2>&1 && git rev-parse --abbrev-ref origin/HEAD | sed s:origin/::)
ls -d */ | xargs -I{} git -C {} pull origin $(git branch --show-current)
