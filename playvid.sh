#!/bin/bash

# Install dependencies quietly
sudo dnf install -y epel-release ffmpeg mplayer libcaca python3-pip > /dev/null
pip3 install --user yt-dlp > /dev/null
export PATH=$PATH:$HOME/.local/bin

# Get YouTube URL
read -p "Enter YouTube video URL: " YTURL

# Resolution choice
echo "Choose ASCII resolution:"
echo "1) Medium (120x36)"
echo "2) High   (160x50)"
echo "3) Ultra  (200x60)"
echo "4) Custom"
read -p "Enter choice [1-4]: " RES

case $RES in
  1) SCALE="scale=120:36" ;;
  2) SCALE="scale=160:50" ;;
  3) SCALE="scale=200:60" ;;
  4) read -p "Enter custom scale WIDTH:HEIGHT (e.g. 192:48): " CUSTOM_SCALE
     SCALE="scale=$CUSTOM_SCALE"
     ;;
  *) echo "Invalid choice. Defaulting to Medium."; SCALE="scale=120:36" ;;
esac

# Rotation choice
echo "Rotate video?"
echo "0) No"
echo "1) Rotate 90Â° Clockwise"
echo "2) Rotate 90Â° Counterclockwise"
echo "3) Rotate 180Â°"
read -p "Enter rotation [0-3]: " ROT

case $ROT in
  0) ROTATE="" ;;
  1) ROTATE=",transpose=1" ;;
  2) ROTATE=",transpose=2" ;;
  3) ROTATE=",transpose=2,transpose=2" ;;
  *) echo "Invalid choice. No rotation."; ROTATE="" ;;
esac

# Download video
echo "Downloading video..."
yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' "$YTURL" -o ascii_temp.mp4

# Convert video preserving audio and fixing pixel format
echo "Converting video..."
ffmpeg -i ascii_temp.mp4 -vf "${SCALE}${ROTATE},format=yuv420p" -c:v mjpeg -q:v 4 -c:a libmp3lame -b:a 128k -y ascii_video.avi

# Play video with ascii art and audio
echo "Playing video (press Q to quit)..."
mplayer -vo caca -ao alsa ascii_video.avi

# Cleanup prompt
read -p "Delete downloaded files? (y/n): " DELETE
if [[ "$DELETE" =~ ^[Yy]$ ]]; then
  rm -f ascii_temp.mp4 ascii_video.avi
  echo "Cleaned up."
else
  echo "Files kept."
fi


