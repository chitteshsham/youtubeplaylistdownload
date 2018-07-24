#!/bin/bash
oldcunt=$(ls ./playlist/ -1 | wc -l) ;
echo "number of songs already downloaded = $oldcunt";
newcunt=$(youtube-dl --flat-playlist --dump-single-json "https://www.youtube.com/watch?v=Bm9rz-llMhE&list=PLrXFitO_y5jUAsNkAzI6_K0kXAeZ1io5v" | jq '.entries' | grep "ie_key" | wc -l) ;
echo "number of songs in Youtube Playlist= $newcunt";

if [ $newcunt -gt $oldcunt ]; then  youtube-dl --extract-audio --audio-format mp3 -o "./playlist/%(title)s.%(ext)s" "https://www.youtube.com/watch?v=Bm9rz-llMhE&list=PLrXFitO_y5jUAsNkAzI6_K0kXAeZ1io5v"; echo "done" ; else echo "already upto date"; fi ;
