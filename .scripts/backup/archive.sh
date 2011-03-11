#!/bin/bash
TARINPUT=/cygdrive/c/backup
TAROUTPUT=/cygdrive/c/backup.tar
TAR=tar
MD5=md5sum
MD5OUTPUT=/cygdrive/c/backup.tar.$MD5

# Tar likes to be executed in the same directory as the archive 
#cd /cygdrive/x

while [ ! -e $TARINPUT ] ; do
    read -p "Please mount the partition $TARINPUT exists on and press enter.";
done

# Create an archive of the backups
$TAR cf $TAROUTPUT $TARINPUT/hourly $TARINPUT/daily $TARINPUT/weekly $TARINPUT/monthly

$MD5 $TAROUTPUT > $MD5OUTPUT

# Copy to external sata drive
DEST=/cygdrive/t
if [ ! -w $DEST ] ; then
    read -p "Please connect to the server...";
fi
cp -f $TAROUTPUT $MD5OUTPUT $DEST

# Copy to server
DEST=/cygdrive/y/Mike
if [ ! -w $DEST ] ; then
    read -p "Please connect to the server...";
fi
cp -f $TAROUTPUT $MD5OUTPUT $DEST

# Copy to flash drive
DEST=/cygdrive/z
if [ ! -w $DEST ] ; then
    read -p "Please connect your thumb drive...";
fi
cp -f $TAROUTPUT $MD5OUTPUT $DEST

read -p "Press enter to close"
