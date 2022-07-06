#!/bin/bash
#

# locate css to update
maincss=`find /usr/lib/plexmediaserver/Resources/ -name "main*.css" | grep WebClient`

# there is more than one css field which might be a match, try each of them
POSSIBLE=`grep -o "PlayButton-playCircle-......{" $maincss`

# loop through each possible match and replace when found
last=""
for i in $POSSIBLE
do
  if [ "$last" != "$i" ]; then
    #echo "$i"

    sed -i 's/\('"$i"'[^}]*;\)display:inline-block/\1display:none/g' $maincss

    # track last tested to avoid repeating a search
    last=$i
  fi
done
