#!/usr/bin/env bash

"/Applications/MKVToolNix-46.0.0.app/Contents/MacOS/mkvmerge" -i $1.mkv
"/Applications/MKVToolNix-46.0.0.app/Contents/MacOS/mkvextract" tracks $1.mkv 2:$1.ass
