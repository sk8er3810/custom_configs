#!/bin/bash

function sync_to_dest
{
  echo "rsync $TAROUTPUT $MD5OUTPUT $1"
  #rsync $TAROUTPUT $MD5OUTPUT $1
}

function archive_backup
{
  # Tar likes to be executed in the same directory as the archive 
  cd $RDIFFBDIR

  while :
  do
    if [ ! -w "$DEST" ] ; then
        echo -e "Error: Please make sure that $DEST is writable." >> ~/.logs/backup.log
        exit
      #read -p "Please make sure that $DEST is writable. Press q to quit..." input
    else
      break
    fi
    if [ "$input" == "q" ] ; then
      return
    fi
  done

  # Create an archive of the backups and a checksum
  echo "$TAR czf \"$TAROUTPUT\" mdeschu"
  cmd="$TAR czf \"$TAROUTPUT\" mdeschu"
  eval $cmd

  echo "$MD5 \"$TAROUTPUT\" > \"$MD5OUTPUT\""
  cmd="$MD5 \"$TAROUTPUT\" > \"$MD5OUTPUT\""
  eval $cmd
}

TAR=`which tar`
MD5=`which md5sum`
RDIFFBDIR=/mnt/backup/
FILENAME=`whoami`-`hostname`-backup-archive
GDRIVE='/mnt/hgfs/G_Drive'
DEST="$GDRIVE"
TAROUTPUT=$GDRIVE/$FILENAME.tar.gz
MD5OUTPUT=$TAROUTPUT.md5

while [ ! -e $RDIFFBDIR ] ; do
    echo -e "Error: Please mount the partition $TARINPUT exists on and press enter." >> ~/.logs/backup.log;
    exit
    #read -p "Please mount the partition $TARINPUT exists on and press enter.";
done

archive_backup

# Copy to external device
#sync_to_dest "$GDRIVE"

read -p "Press enter to close"
