#!/usr/bin/env bash

cd $(dirname 0) ### cd to cwd

find . -type d -maxdepth 3 2>&1 | grep -v '^.$|^..$' | while read LN; do
  if [ -n "$BASHER_DEBUG" ] ; then
    echo cd $LN ; echo cd ..
  fi
  BASHER_LOADER_HOOK_FILENAME="loader.bash"
  if [ -f "$BASHER_LOADER_HOOK_FILENAME" ] ; then
    source "$BASHER_LOADER_HOOK_FILENAME"
  fi
done
