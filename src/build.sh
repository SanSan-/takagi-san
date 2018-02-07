#!/usr/bin/env bash

if [ -z "$1" ]
then
      7z a -t7z takagi-san.7z -ir@"./src/building_files.txt"
else
      7z a -t7z takagi-san.7z -ir@"./$1building_files.txt"
fi