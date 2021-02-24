#!/usr/bin/env bash

cd $(dirname $BASH_SOURCE[0]) ### cd to cwd

find . -type f -maxdepth 3 -iname 'loader.bash' 2>&1 | grep -v '^.$|^..$' | while read LN; do
  if [ -n "$BASHER_DEBUG" ] ; then
    echo $(dirname $LN)
  fi
  pushd $(dirname $LN) > /dev/null
  BASHER_LOADER_HOOK_FILENAME="loader.bash"
  if [ -f "$BASHER_LOADER_HOOK_FILENAME" ] ; then
    source "$BASHER_LOADER_HOOK_FILENAME"
  else
    :
  fi
  popd > /dev/null
done

exec bash -i