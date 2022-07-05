#!/bin/bash
# $1 = the passed in parameter
#      - accepts 'true' or 'false'

# - searches for the 'AcceptedEULA' attribute to identify the Preferences xml object
# - if 'RelayEnabled' attribute is present then set to 0 or 1 based on passed in parameter
if [ $1 = "true" ]; then
  xmlstarlet edit --inplace --update "//*[@AcceptedEULA=\"1\"]/@RelayEnabled" --value "1" --insert "//*[@AcceptedEULA=\"1\"][not(@RelayEnabled)]" --type attr -n RelayEnabled -v "1" /config/Library/Application Support/Plex Media Server/Preferences.xml
else
  xmlstarlet edit --inplace --update "//*[@AcceptedEULA=\"1\"]/@RelayEnabled" --value "0" --insert "//*[@AcceptedEULA=\"1\"][not(@RelayEnabled)]" --type attr -n RelayEnabled -v "0" /config/Library/Application Support/Plex Media Server/Preferences.xml
fi
