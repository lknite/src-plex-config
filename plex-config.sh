#!/bin/bash

# load up environment variables with values to set
SETTINGS=`printenv | grep PLEX_CONFIG`

for SETTING in $SETTINGS
do
  ##
  # parse off setting

  # get name of the setting (from the name=value string)
  NEXT=`echo $SETTING | awk '{split($0,a,"="); print a[1]}'`
  
  ##
  # get script path

  # remove the PLEX_CONFIG_ prepended value
  SCRIPT=$NEXT
  SCRIPT=${SCRIPT#*_} 
  SCRIPT=${SCRIPT#*_} 

  # ensure lowercase
  SCRIPT="$(echo $SCRIPT | tr '[:upper:]' '[:lower:]')"

  # form path
  SCRIPTPATH="./settings/${SCRIPT}/${SCRIPT}.sh"

  ##
  # display & execute

  # call the script which knows how to set this value
  echo "Configuring $SCRIPT ..."
  $SCRIPTPATH "${!NEXT}"
done
