#!/bin/bash
# $1 = the passed in parameter
#      a string used to identify media server to other computers on your network

# - searches for the 'AcceptedEULA' attribute to identify the Preferences xml object
# - if 'FriendlyName' attribute is present then set to value of passed in parameter, otherwise add it
xmlstarlet edit --inplace --update "//*[@AcceptedEULA=\"1\"]/@FriendlyName" --value "$1" --insert "//*[@AcceptedEULA=\"1\"][not(@FriendlyName)]" --type attr -n FriendlyName -v "$1" /config/Library/Application Support/Plex Media Server/Preferences.xml
