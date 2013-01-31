#!/bin/bash

echo mdeschu MONTHLY
rdiff-backup --list-increments /backup/mdeschu/monthly
echo mdeschu WEEKLY
rdiff-backup --list-increments /backup/mdeschu/weekly
echo mdeschu DAILY
rdiff-backup --list-increments /backup/mdeschu/daily
echo mdeschu HOURLY
rdiff-backup --list-increments /backup/mdeschu/hourly
