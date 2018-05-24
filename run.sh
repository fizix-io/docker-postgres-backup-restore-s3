#! /bin/sh
set -e

# Verify all en vars exist
if [ "${AWS_ACCESS_KEY_ID}" = "**None**" ]; then
    echo "You need to set the AWS_ACCESS_KEY_ID environment variable."
    exit 1
fi

if [ "${AWS_SECRET_ACCESS_KEY}" = "**None**" ]; then
    echo "You need to set the AWS_SECRET_ACCESS_KEY environment variable."
    exit 1
fi

if [ "${S3_BUCKET}" = "**None**" ]; then
    echo "You need to set the S3_BUCKET environment variable."
    exit 1
fi

if [ "${PGHOST}" = "**None**" ]; then
    echo "You need to set the PGHOST environment variable."
    exit 1
fi

if [ "${PGUSER}" = "**None**" ]; then
    echo "You need to set the PGUSER environment variable."
    exit 1
fi

if [ "${PGPASSWORD}" = "**None**" ]; then
    echo "You need to set the PGPASSWORD environment variable or link to a container named POSTGRES."
    exit 1
fi

# Trigger command
command=${1-backup}

if [ "$command" == "backup" ];
then
    source backup.sh
elif [ "$command" == "restore" ];
then
    source restore.sh
elif [ "$command" == "download" ];
then
    source download.sh
fi
