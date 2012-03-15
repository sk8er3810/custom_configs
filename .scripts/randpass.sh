#!/bin/bash

#example
# cat /dev/urandom | env LC_CTYPE=C tr -cd [:print:] | head -c 10; echo

cat /dev/urandom | env LC_CTYPE=C tr -cd $1 | head -c $2; echo
