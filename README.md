## Summary

A method to configure plex options which would otherwise require gui interaction.

## Execution

Normally this script is not called directly, but via a customized plex image or helm chart.

## How it works

See ./settings for available settings which can be configured, note the folder name(s).

To configure a setting specify the folder name as an environment variable prepended with 'PLEX_CONFIG_' and then run plex-config.sh.

example.sh
```
#!/bin/bash

PLEX_CONFIG_NETWORK_ENABLE_RELAY=false
PLEX_CONFIG_TRANSCODER_DEFAULT_THROTTLE_BUFFER=600
PLEX_CONFIG_UNIQUE_REMOVE_PAUSE_ARROW_OVERLAY=true

./plex-config.sh
```

output
```
Configuring transcoder_default_throttle_buffer ... done
Configuring network_enable_relay ... done
Configuring unique_remove_pause_arrow_overlay ... done
```
