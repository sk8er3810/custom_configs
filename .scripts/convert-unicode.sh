#!/bin/bash
iconv -f utf-16 -t utf-8 "${1}" | less
