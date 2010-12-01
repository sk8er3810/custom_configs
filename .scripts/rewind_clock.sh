#!/bin/sh
#The Dell Latitude E6500 gets to be about 30 seconds ahead per week
#Rewind the clock 30 seconds
date -s "$(date -d '30 seconds ago')" 
