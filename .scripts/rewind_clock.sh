#!/bin/bash
#The Dell Latitude E6500 gets to be about 30 seconds ahead per week
#Rewind the clock 30 seconds
/usr/bin/date -s "$(/usr/bin/date -d '30 seconds ago')" 
