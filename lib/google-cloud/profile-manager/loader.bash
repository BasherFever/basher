#!/usr/bin/env bash

###
### gcloud-profile-manager
###
###  a profile selector for gcloud configurations profile interface.
###

BASHER_GCLOUD_CONFIG_STORE=~/.config/gcloud/configurations
BASHER_GCLOUD_PROFILE_LIST=

if [ -d "$BASHER_GCLOUD_CONFIG_STORE" ] ; then
  BASHER_GCLOUD_PROFILE_LIST="$(ls $BASHER_GCLOUD_CONFIG_STORE)"
  if [ -n "$BASHER_DEBUG" ] ; then
    echo $BASHER_GCLOUD_PROFILE_LIST
  fi
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

exit 0