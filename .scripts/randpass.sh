#!/bin/bash
# This script takes char set and length
# as args to create a random password
# containing the characters in char_set
# of a specified length

#example
# cat /dev/urandom | env LC_CTYPE=C tr -cd [:print:] | head -c 10; echo

if [ -z $2 ]; then
    echo "Usage: randpass.sh <char set> <length>";
    exit 1;
fi

CHAR_SET=$1
LENGTH=$2
cat /dev/urandom | env LC_CTYPE=C tr -cd $CHAR_SET | head -c $LENGTH; echo

