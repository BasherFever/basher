#!/usr/bin/env bash

function _basher_err_quit() {
    echo "$0: $1 quit." 1>&2
    exit $2
}

if [ "$SHLVL" -ne 1 ] ; then ### is not login shell
  if [ "$0" == 'index.bash' ] ; then
    :
  else
    _basher_err_quit "not a login shell." 255
  fi
fi

cd $(dirname 0) ### cd to This Directory

if [ ! -d "lib" ] ; then
  _basher_err_quit "'lib' directory not found. "
fi

cd lib
. ./wonderer.bash