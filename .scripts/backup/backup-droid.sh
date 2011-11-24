#!/bin/bash

if [ "$(uname -s)" = 'Darwin' ]; then
    SRC_DIR=/Volumes/SDDROID
    DEST_DIR="/Volumes/My Passport/rdiff-backups/sholes.sdcard"
    PROG=rdiff-backup
    FLAGS="${FLAGS}"
elif [ "$OSTYPE" = 'cygwin' ]; then
    BACKUP_DIR=/cygdrive/g
    DEST_DIR=/cygdrive/t/backup/mike.droid
    PROG=rdiff-backup
    FLAGS="${FLAGS}"
fi

EXCLUDE_FILE=${SRC_DIR}/.rdiff-backup.exclude
FLAGS="--verbosity 5 --terminal-verbosity 5 --exclude-globbing-filelist ${EXCLUDE_FILE}"

${PROG} ${FLAGS} ${SRC_DIR} "${DEST_DIR}"
#rdiff-backup --verbosity 5 --terminal-verbosity 5 --exclude-globbing-filelist /cygdrive/g/.rdiff-backup.exclude /cygdrive/g/ /cygdrive/t/backup/mike.flashdrive
