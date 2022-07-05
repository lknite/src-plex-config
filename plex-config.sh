#!/bin/bash

# load up environment variables with values to set
SETTINGS=`env | grep PLEX_CONFIG`

for SETTING in $SETTINGS
do
  echo "[$SETTING]"
done
