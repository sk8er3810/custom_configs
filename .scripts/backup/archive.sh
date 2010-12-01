#!/bin/bash
TARINPUT=/cygdrive/x/backup
TAROUTPUT=/cygdrive/x/backup.tar
TAR=tar
MD5=md5sum
MD5OUTPUT=/cygdrive/x/backup.tar.$MD5

# Tar likes to be executed in the same directory as the archive 
#cd /cygdrive/x

while [ ! -e $TARINPUT ] ; do
    read -p "Please mount the partition $TARINPUT exists on and press enter.";
done

# Create an archive of the backups
$TAR cf $TAROUTPUT $TARINPUT/hourly $TARINPUT/daily $TARINPUT/weekly $TARINPUT/monthly

$MD5 $TAROUTPUT > $MD5OUTPUT

# Copy to server
SERVER=/cygdrive/y
if [ ! -w $SERVER ] ; then
    read -p "Please connect to the server...";
fi
cp -f $TAROUTPUT $MD5OUTPUT $SERVER/Mike

# Copy to flash drive
EXTERNAL=/cygdrive/z
if [ ! -w $EXTERNAL ] ; then
    read -p "Please connect your thumb drive...";
fi

cp -f $TAROUTPUT $MD5OUTPUT $EXTERNAL

read -p "Press enter to close"
