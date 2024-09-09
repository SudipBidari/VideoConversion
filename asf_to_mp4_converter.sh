#!/bin/bash

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null
then
    echo "ffmpeg could not be found, please install it."
    exit 1
fi

# Check if correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input_directory output_directory"
    exit 1
fi

input_directory="$1"
output_directory="$2"

# Check if input directory exists
if [ ! -d "$input_directory" ]; then
    echo "Input directory does not exist: $input_directory"
    exit 1
fi

# Create output directory if it doesn't exist
if [ ! -d "$output_directory" ]; then
    mkdir -p "$output_directory"
    echo "Created output directory: $output_directory"
fi

# Process each ASF file in the input directory
for input_file in "$input_directory"/*.asf; do
    # Check if there are no ASF files
    if [ "$input_file" = "$input_directory/*.asf" ]; then
        echo "No ASF files found in the input directory."
        exit 1
    fi

    # Extract the base name and create output file path
    base_name=$(basename "$input_file" .asf)
    output_file="$output_directory/$base_name.mp4"

    # Convert the file
    ffmpeg -i "$input_file" "$output_file"

    # Check if conversion was successful
    if [ $? -eq 0 ]; then
        echo "Converted: $input_file to $output_file"
    else
        echo "Failed to convert: $input_file"
    fi
done
