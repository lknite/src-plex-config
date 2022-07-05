#!/bin/bash
# $1 = the passed in parameter
#      a number, by default 60, though 600 is recommended

# - searches for the 'AcceptedEULA' attribute to identify the Preferences xml object
# - if 'TranscoderThrottleBuffer' attribute is present then set to value of passed in parameter
xmlstarlet edit --inplace --update "//*[@AcceptedEULA=\"1\"]/@TranscoderThrottleBuffer" --value "$1" --insert "//*[@AcceptedEULA=\"1\"][not(@TranscoderThrottleBuffer)]" --type attr -n TranscoderThrottleBuffer -v "$1" /config/Library/Application Support/Plex Media Server/Preferences.xml
