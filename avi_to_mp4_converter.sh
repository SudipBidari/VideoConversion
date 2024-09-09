#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input_directory output_directory"
    exit 1
fi

INPUT_DIR="$1"
OUTPUT_DIR="$2"

# Check if input directory exists
if [ ! -d "$INPUT_DIR" ]; then
    echo "Input directory does not exist."
    exit 1
fi

# Create output directory if it does not exist
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
fi

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "FFmpeg is not installed. Please install FFmpeg and try again."
    exit 1
fi

# Convert all .avi files in the input directory
shopt -s nullglob
for FILE in "$INPUT_DIR"/*.avi; do
    # Skip if no .avi files are found
    if [ ! -e "$FILE" ]; then
        echo "No .avi files found in $INPUT_DIR"
        exit 0
    fi

    BASENAME=$(basename "$FILE" .avi)
    OUTPUT_FILE="$OUTPUT_DIR/$BASENAME.mp4"

    echo "Converting $FILE to $OUTPUT_FILE..."
    ffmpeg -i "$FILE" -c:v libx264 -crf 23 -preset fast -c:a aac -b:a 192k "$OUTPUT_FILE"

    if [ "$?" -eq 0 ]; then
        echo "Conversion successful: $OUTPUT_FILE"
    else
        echo "Conversion failed: $FILE"
    fi
done
