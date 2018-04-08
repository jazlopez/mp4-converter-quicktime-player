#!/bin/bash

# Problem:
# Quick Time could not reproduce files downloaded by youtube-dl

# Solution:
# By using ffmpeg fix mp4 format

# Jaziel Lopez <juan.jaziel@gmail.com>
# jlopez.mx

# Example:
# $ ./tomp4.sh any-downloaded-youtube-dl-file.mp4

echo "Received Arguments: $1"
original=$1
fname=${1// /.}

mv -f "$original" "$fname"

if [ $? -eq 0 ]; then
    echo "Fixing file name to $fname completed"
else
    echo "Failed to move original file.Bye"
    exit 1
fi

OUTPUT="transcoded"

mkdir -p $OUTPUT

ffmpeg -i $fname -c:v libx264 $OUTPUT/$fname && echo "Deleting original.... " rm $fname

if [ $? -eq 0 ]; then
    echo "Removing source: $fname  ... " && rm $fname
fi

echo "Transcoding completed"


