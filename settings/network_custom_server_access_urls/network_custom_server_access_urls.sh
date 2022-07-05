#!/bin/bash
# $1 = the passed in parameter
#      a string of urls to register as how this server can be accessed (plex mobile will use this value)

# - searches for the 'AcceptedEULA' attribute to identify the Preferences xml object
# - if 'customConnections' attribute is present then set to value of passed in parameter, otherwise add it
xmlstarlet edit --inplace --update "//*[@AcceptedEULA=\"1\"]/@customConnections" --value "$1" --insert "//*[@AcceptedEULA=\"1\"][not(@customConnections)]" --type attr -n customConnections -v "$1" /config/Library/Application Support/Plex Media Server/Preferences.xml
