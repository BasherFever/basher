#!/usr/bin/env bash
###
### gcloud-profile-manager
###
###  a profile selector for gcloud configurations profile interface.

### usage:
###   $0 <some argument> : show the fzf profile selector.
###   $0 : nothing to do. exit 0;
###

BASHER_GCLOUD_CONFIG_STORE=~/.config/gcloud/configurations
BASHER_GCLOUD_PROFILE_LIST=

if [ -d "$BASHER_GCLOUD_CONFIG_STORE" ] ; then
  BASHER_GCLOUD_PROFILE_LIST="$(ls $BASHER_GCLOUD_CONFIG_STORE)"
  if [ -n "$BASHER_DEBUG" ] ; then
    echo $BASHER_GCLOUD_PROFILE_LIST
  fi
  if [ $# -gt 0 ] ; then
    command -v fzf > /dev/null 2>&1
    if [ $? -eq 0 ] ; then ### fzf is available
      BASHER_GCLOUD_SELECTED_PROFILE_NAME=$(echo $BASHER_GCLOUD_PROFILE_LIST | sed -e  's/ /\n/g' | fzf --ansi || true)
      if [ -n "$BASHER_GCLOUD_SELECTED_PROFILE_NAME" ] ; then
        gcloud config configurations activate $(echo $BASHER_GCLOUD_SELECTED_PROFILE_NAME | sed -e 's/config_//g')
      fi
    else
      echo $BASHER_GCLOUD_PROFILE_LIST
    fi
  fi
fi

exit 0