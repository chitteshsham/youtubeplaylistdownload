#!/bin/bash

echo "paste your youtube playlist url"
read ytplaylist

echo "insert folder name to download"
read folder

mkdir $folder
oldcount=$(ls ./$folder/ -1 | wc -l) ;
echo "number of songs already downloaded = $oldcunt";
newcount=$(youtube-dl --flat-playlist --dump-single-json $ytplaylist | jq '.entries' | grep "ie_key" | wc -l) ;
echo "number of songs in Youtube Playlist= $newcount";

if [ $newcount -gt $oldcount ]; then youtube-dl --extract-audio --audio-format mp3 -o "./playlist/%(title)s.%(ext)s" $ytplaylist; echo "done" ; else echo "already upto date"; fi ;
