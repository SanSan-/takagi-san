#!/usr/bin/env bash

FOLDER = $1
FOLDER = ${FOLDER:="src/"}

7z a -t7z takagi-san.7z -ir@"./"$FOLDER"building_files.txt"