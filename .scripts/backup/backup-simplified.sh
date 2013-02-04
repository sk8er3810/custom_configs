#!/bin/bash
backup ()
{
BACKUP_PROG=/usr/bin/rdiff-backup
SOURCE_DIR=$1
DESTINATION_DIR=$2
if [ -w $DESTINATION_DIR ]; then

   echo "Performing ${TYPE} rdiff-backup of ${SOURCE_DIR}"
   ${BACKUP_PROG} --no-compression --exclude-globbing-filelist ${1}/.rdiff-backup.exclude --exclude-symbolic-links ${EXCLUDE_REGEX} ${SOURCE_DIR} ${DESTINATION_DIR}
   echo -e "Finished rdiff-backup of ${SOURCE_DIR}\n"

   echo "Removing backups older than ${DAYS_TO_KEEP}"
   ${BACKUP_PROG} --force --remove-older-than ${DAYS_TO_KEEP} ${DESTINATION_DIR}
   echo -e "Finished removing old backups of ${SOURCE_DIR}\n\n"
else
   echo "NOT ABLE TO WRITE TO ${DESTINATION_DIR}"
fi
}

# Exclude these build directories from being backed up
BUILD_DIRS='(Debug|Release|bin|obj|.svn|.cvs)$'
# Exclude these files that get automatically generated from being backed up
BUILD_FILES='\.(exe|ncb|pch|obj|vssscc|vspscc|scc|aps|APS|suo|ini|o|lis|class|pyc)'
# build exclude command line argument
EXCLUDE_REGEX="--exclude-regexp ${BUILD_DIRS} --exclude-regexp ${BUILD_FILES} --exclude-regexp NTUSER|ntuser"

#Backup home directory
SOURCE_DIR=${HOME}
DESTINATION_DIR="/mnt/backup/`whoami`/"
DAYS_TO_KEEP='28D'
backup ${SOURCE_DIR} ${DESTINATION_DIR} ${DAYS_TO_KEEP}

#Backup home directory
SOURCE_DIR=${HOME}/repos
DESTINATION_DIR="/mnt/backup/repos/"
DAYS_TO_KEEP='28D'
backup ${SOURCE_DIR} ${DESTINATION_DIR} ${DAYS_TO_KEEP}
