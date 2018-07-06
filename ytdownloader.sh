#!/bin/bash
oldcount=$(ls ./playlist/ -1 | wc -l) ;
echo "number of songs already downloaded = $oldcunt";
newcount=$(youtube-dl --flat-playlist --dump-single-json "https://www.youtube.com/watch?v=Bm9rz-llMhE&list=PLrXFitO_y5jUAsNkAzI6_K0kXAeZ1io5v" | jq '.entries' | grep "ie_key" | wc -l) ;
echo "number of songs in Youtube Playlist= $newcount";

if [ $newcount -gt $oldcount ]; then  youtube-dl --extract-audio --audio-format mp3 -o "./playlist/%(title)s.%(ext)s" "https://www.youtube.com/watch?v=Bm9rz-llMhE&list=PLrXFitO_y5jUAsNkAzI6_K0kXAeZ1io5v"; echo "done" ; else echo "already upto date"; fi ;
