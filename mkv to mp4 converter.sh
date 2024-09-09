#!/bin/bash

# Directory containing MKV files
INPUT_DIR="./mkv"      # Change this to your input directory
OUTPUT_DIR="./converted"    # Change this to your output directory

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through all MKV files in the input directory
for mkv_file in "$INPUT_DIR"/*.mkv; do
    # Extract the filename without the extension
    base_name=$(basename "$mkv_file" .mkv)
    
    # Define the output file path
    mp4_file="$OUTPUT_DIR/$base_name.mp4"

    # Convert the MKV file to MP4 using FFmpeg
    ffmpeg -i "$mkv_file" -codec copy "$mp4_file"

    echo "Converted $mkv_file to $mp4_file"
done
