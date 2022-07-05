#!/bin/bash

# load up environment variables with values to set
SETTINGS=`printenv | grep PLEX_CONFIG`

# loop through settings performing requested configuration on each
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

  # display next action
  echo -n "Configuring $SCRIPT ..."

  # call the script which knows how to set this value
  $SCRIPTPATH "${!NEXT}"

  # display result of the script
  if [ $? -eq 0 ]; then
    echo -n " success"
  elif [ $? -eq 1 ]; then
    echo -n " failed"
  else 
    echo -n " unknown"
  fi
  echo ", done"

done
