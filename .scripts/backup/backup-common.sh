#!/bin/bash
backup ()
{
BACKUP_PROG=/usr/bin/rdiff-backup
SOURCE_DIR=$1
DESTINATION_DIR=$2
if [ -w $DESTINATION_DIR ]; then

   echo "Performing ${TYPE} rdiff-backup of ${SOURCE_DIR}"
   ${BACKUP_PROG} --no-compression --exclude-symbolic-links ${EXCLUDE_REGEX} --exclude-globbing-filelist ~/.scripts/backup/exclude.txt ${SOURCE_DIR} ${DESTINATION_DIR}
   echo -e "Finished rdiff-backup of ${SOURCE_DIR}\n"

   echo "Removing backups older than ${NUM_DAYS}"
   ${BACKUP_PROG} --force --remove-older-than ${NUM_DAYS} ${DESTINATION_DIR}
   echo -e "Finished removing old backups of ${SOURCE_DIR}\n\n"
else
   echo "NOT ABLE TO WRITE TO ${DESTINATION_DIR}"
fi
}

# Exclude these build directories from being backed up
BUILD_DIRS='(Debug|Release|bin|obj)$'
# Exclude these files that get automatically generated from being backed up
BUILD_FILES='\.(exe|ncb|pch|obj|vssscc|vspscc|scc|aps|APS|suo|ini)'

EXCLUDE_REGEX="--exclude-regexp ${BUILD_DIRS} --exclude-regexp ${BUILD_FILES} --exclude-regexp NTUSER|ntuser"

NUM_DAYS=${1}
TYPE=${2}

#Backup local git repository
SOURCE_DIR="/cygdrive/c/src"
DESTINATION_DIR="/cygdrive/t/backup/src/${TYPE}"
backup ${SOURCE_DIR} ${DESTINATION_DIR} ${NUM_DAYS}

#Backup home directory
SOURCE_DIR=~
DESTINATION_DIR="/cygdrive/t/backup/mike/${TYPE}"
backup ${SOURCE_DIR} ${DESTINATION_DIR} ${NUM_DAYS}

