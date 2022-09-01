#!/bin/bash

command -v "heif-convert" >/dev/null 2>&1 || { echo "It requires heif-convert, but it is not installed, or not on the path."; exit 1; }

for file in "$@"
do
    filename=$(basename "$file")
    filename_without_extension="${filename%.*}"
    
    jpeg_filename="${filename_without_extension}.jpg"
    
    echo "Converting $file to $jpeg_filename"
    
    heif-convert "$filename" "./output/$jpeg_filename"
done