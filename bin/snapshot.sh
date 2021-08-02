#!/bin/bash
[ $# -ne 2 ] && echo "usage: $0 REPO HASH" 2> /dev/null && exit 1
path=$HOME/snapshot/$(basename $1)-$2
[ -d $path ] && exit 0
git clone $1 $path && git -C $path checkout $2
