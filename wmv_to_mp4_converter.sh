#!/bin/bash

source_dir="$1"
dest_dir="$2"

if [ -z "$source_dir" ]; then
    echo "Usage: $0 source_directory destination_directory"
    exit 1
fi

if [ -z "$dest_dir" ]; then
    echo "Usage: $0 source_directory destination_directory"
    exit 1
fi

if [ ! -d "$dest_dir" ]; then
    echo "Creating destination directory: $dest_dir"
    mkdir -p "$dest_dir"
fi

for input_file in "$source_dir"/*.wmv; do
    if [ -e "$input_file" ]; then
        filename=$(basename "$input_file")
        output_file="$dest_dir/${filename%.wmv}.mp4"
        echo "Converting $input_file to $output_file"
        ffmpeg -i "$input_file" -c:v libx264 -c:a aac "$output_file"
    fi
done
