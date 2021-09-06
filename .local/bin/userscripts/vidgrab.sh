#!/usr/bin/env sh
if [ -z "$1"];then
  echo "Usage: $(basename $0) [ URL ] ([OUTPUT_FILE])";
else
  $OUTPUT_NAME="video.mp4";
  if [ -z "$2" ]; then  
    ffmpeg -protocol_whitelist file,http,https,tcp,tls,crypto -i "$1" -c copy video.mp4;
  else
    ffmpeg -protocol_whitelist file,http,https,tcp,tls,crypto -i "$1" -c copy "$2";
  fi
fi
