#!/usr/bin/bash


###############################################################################
# do-daily-backup.sh                                                          #
###############################################################################
# This script is my attempt at replicating the same function that timeshift   #
# performs. This is a very simplified script to handle automated btrfs        #
# snapshots via a daily cron entry.                                           #
#                                                                             #
# EX:                                                                         #
# ```                                                                         #
# 0 0 * * * /path/to/script                                                   #
# ```                                                                         #
#                                                                             #
# Afer putting it in your crontab it will automatically handle your making    #
# snapshots for your system and will only make up to the limit you set with   #
# LIMIT.                                                                      #
#                                                                             #
# You will also have to configure your own subvols in the array decleration   #
# SUBVOLS following the same format in the comments above it.                 #
#                                                                             #
###############################################################################


# BEGIN: Variables

## Reusable vars
DATE=`date +%Y-%m-%d`
### Getting the name of the script (as it will be the first thing passed to bash when executing)
SCRIPT=`basename $0` 
BACKUP_DIR=/.backups
### Setting dir to house log files
LOG_DIR=/var/log/$SCRIPT

LOG_FILE=$LOG_DIR/$DATE.log

## The amount of backups that are allowed of each configured subvols
LIMIT=5

## Because cron fucks our env, and loading /etc/bashrc doesn't always fix it
alias btrfs='/usr/bin/btrfs'

## The subvols that we want to backup
### <actual-directory>:<name-of-backup-dir>
declare -a SUBVOLS=(
	/:root
	/home:home
)

## To use to seperate named manual backups from automatic ones
DATE_REGEX='[0-9]{4}-[0-9]{2}-[0-9]{2}'
# END: Variables


# BEGIN: Pre-Work Checks

## This will check to make sure that the log directory has been created, if not it will create it
[[ ! -d $LOG_DIR ]] && mkdir -p $LOG_DIR
## Setting up the script to direct all output to the log file for this snapshot session
exec > $LOG_FILE


# END: Pre-Work Checks


# BEGIN: Work
for SUBVOL_INFO in ${SUBVOLS[@]}; do

	## Stripping the delemited info out of the subvol entry
	OIFS=$IFS
	IFS=':'
	read DIR NAME <<< "$SUBVOL_INFO"
	IFS=$OIFS
	echo "Subvol : $DIR, Name: $NAME"

	SUBVOL_BACKUP_DIR=$BACKUP_DIR/$NAME

	## This will handle creating the backup directory as well as the specific snapshot directory as well
	[[ ! -d $SUBVOL_BACKUP_DIR ]] && mkdir -p $SUBVOL_BACKUP_DIR

	## Implemented it this way so that it's less complex to handle when there are more backups than we are
	## configured to keep. Definately a rather stupid way to implement it, but it works and requires less logic to handle
	while true; do
		## So that any manual ones I do (named pre-upgrade, etc) will remain. And it will only delete the
		## Automatic timestamped ones
		declare -a backups=( $( ls -1 $SUBVOL_BACKUP_DIR | grep -Eo $DATE_REGEX ) )
		echo "${#backups[@]} backups were found the backup dir $SUBVOL_BACKUP_DIR"

		if [[ ${#backups[@]} -ge $LIMIT ]]; then
			SNAPSHOT_PATH="$SUBVOL_BACKUP_DIR/${backups[0]}"
			echo "${#backups[@]} was found to be equal to or greater than $LIMIT. Deleting $SNAPSHOT_PATH."
			btrfs subvol del "$SUBVOL_BACKUP_DIR/${backups[0]}"
		else
			break
		fi

		## Unsetting the backups list so that it can be reloaded again
		unset backups $SNAPSHOT_PATH
	done

	SNAPSHOT=$SUBVOL_BACKUP_DIR/$DATE
	## If the snapshot doesn't already exist, then create a new read-only snapshot
	[[ ! -d $SNAPSHOT ]] && btrfs subvol snapshot -r $DIR $SNAPSHOT
done

# END: Work
