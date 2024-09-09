# Video Conversion to mp4
Video conversion is where a video is converted from one format to another. However, in this program we've focused on conversion of different video formats to mp4 which is generally or we could say widely used. It uses shell script, so it only supports MacOS or UNIX based OS only.

## List of coversions supported rn:
1. MKV to MP4
2. WMV to MP4
3. ASF to MP4
4. AVI to MP4
5. FLV to MP4

## How to use it?
### To run it you must have homebrew on your device if it's macOS. You can install hombrew on your device from [here](https://brew.sh/).

1. Install FFmpeg:\
   **MacOS:** Install via Homebrew with **brew install ffmpeg**.\
   **Linux:** Install via package manager with **sudo apt-get install ffmpeg**.

2. Make it executable:\
   Run **chmod +x filename.sh** to make the script executable.

3. Execute it on terminal:\
   **./filename.sh /input_directory /output_directory**

Now, All the files on your directory should be converted to mp4 format.

**NOTE:\ Check the format of the video to be converted on your input directory and the format that the code supports as these are different scripts for different formats and the files
         are expected to be run individually according to the format to be converted. Hope this explaination helped. :)**

        🌸Have a Good Day!🌸
