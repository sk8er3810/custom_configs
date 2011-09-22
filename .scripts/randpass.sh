#!/bin/bash

#example
# echo $(</dev/urandom tr -dc A-Za-z0-9'$*' | head -c14 )

echo $(</dev/urandom tr -dc $1 | head -c$2 )
