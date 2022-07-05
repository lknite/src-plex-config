#!/bin/bash

# load up environment variables with values to set
SETTINGS=`printenv | grep PLEX_CONFIG`

for SETTING in $SETTINGS
do
  NEXT=`echo $SETTING | awk '{split($0,a,"="); print a[1]}'`
  echo "[$NEXT]"
  echo "Executing ./settings/$(echo $NEXT | tr '[:upper:]' '[:lower:]').sh"

done
