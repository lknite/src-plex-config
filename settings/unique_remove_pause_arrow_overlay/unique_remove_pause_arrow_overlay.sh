#!/bin/bash
#
# 1. Looks in the css a string starting with 'PlayButton-playCircl-<6 characters>{'
# 2. Then, any number of any characters except for '}'
# 3. If 'display:inline-block' is found before '}' stops the search, we have a match
# 4. Replace the 'display:inline-block' with 'display:none', using '\1' to replace the matched string


# locate css to update
maincss=`find /usr/lib/plexmediaserver/Resources/ -name "main*.css" | grep WebClient`

# there is more than one css field which might be a match, try each of them
POSSIBLE=`grep -o "PlayButton-playCircle-......{" $maincss`

# loop through each possible match and replace when found
last=""
for i in $POSSIBLE
do
  if [ "$last" != "$i" ]; then

    # replace the 'display:inline-block' with 'display:none'
    sed -i 's/\('"$i"'[^}]*\)display:inline-block/\1display:none/g' $maincss

    # track last tested to avoid repeating a search
    last=$i
  fi
done
