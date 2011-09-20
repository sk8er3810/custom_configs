#!/bin/sh
MYSQLPATH="/cygdrive/c/Program Files/Bitnami Redmine Stack/mysql/bin"
TMPDEST="/tmp/redmine-backup/"
DEST="/cygdrive/t/backup/redmine/"
RDBACKUP="/usr/bin/rdiff-backup"

if [ ! -d /tmp/redmine-backup ]; then
  mkdir -p ${TMPDEST}
fi

"${MYSQLPATH}\mysqldump.exe" -u bitnami -p6a858624ab bitnami_redmine > ${TMPDEST}/redmine-backup.sql

${RDBACKUP} --no-compression ${TMPDEST} ${DEST}
${RDBACKUP} --force --remove-older-than 30D ${DEST}
