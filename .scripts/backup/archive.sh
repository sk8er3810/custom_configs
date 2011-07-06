#!/bin/bash

function copy_to_dest
{
  DEST=$1
  while :
  do
    if [ ! -w $DEST ] ; then
      read -p "Please make sure that $DEST is writable. Press q to quit..." input
    else
      break
    fi
    if [ "$input" == "q" ] ; then
      break
    fi
  done
  cp -f $TAROUTPUT $MD5OUTPUT $DEST
}

TAR=/usr/bin/tar
MD5=/usr/bin/md5sum
RDIFFBDIR=/cygdrive/t/backup/
FILENAME=backup-archive
TAROUTPUT=$FILENAME.tar
MD5OUTPUT=$FILENAME.tar.md5
SERVER=/cygdrive/y/Mike/
FLASHDRIVE=/cygdrive/z/

while [ ! -e $RDIFFBDIR ] ; do
    read -p "Please mount the partition $TARINPUT exists on and press enter.";
done

# Tar likes to be executed in the same directory as the archive 
cd $RDIFFBDIR

# Create an archive of the backups and a checksum
$TAR cf $TAROUTPUT weekly monthly redmine
$MD5 $TAROUTPUT > $MD5OUTPUT

# Copy to server
copy_to_dest $SERVER

# Copy to flash drive
copy_to_dest $FLASHDRIVE

read -p "Press enter to close"
