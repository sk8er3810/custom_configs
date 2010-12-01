#!/bin/bash
# Finds all unique file extensions within the current directory
# Useful for creating lists of files to exclude from applications
# such as git, or other SCMs 
#
# Copyright 2010 Michael Deschu
#
# This script is free to use, modify and distribute
# however the original author holds no responsiblity
# for consquences of using or distributing this script

# developed in cygwin under Windows XP and Windows 7
find . \
-path '*/.git' -prune -and \
-path '*/.cvs' -prune -and \
-path '*/.svn' -prune -o \
-name '*' -type f | while read file
do
    echo ${file##*.} # strip out everything except the file extension
done | sort -u  # remove all duplicate file extensions
