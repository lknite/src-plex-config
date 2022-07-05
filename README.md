## Summary

A method to configure plex options which would otherwise require gui interaction.

## Execution

Normally this script is not called directly, but via a customized plex image or helm chart.

## How it works

See ./settings for available settings which can be configured, note the folder names.

To configure a setting specify the folder name as an environment variable prepended with 'PLEX_CONFIG_' and with all underscores '_', for example:

export PLEX_CONFIG_NETWORK_ENABLE_RELAY=false

Then execute the script:
./plex-config.sh
