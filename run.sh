#! /bin/sh
set -e

# Verify all en vars exist
if [ "${S3_ACCESS_KEY_ID}" = "**None**" ]; then
    echo "You need to set the S3_ACCESS_KEY_ID environment variable."
    exit 1
fi

if [ "${S3_SECRET_ACCESS_KEY}" = "**None**" ]; then
    echo "You need to set the S3_SECRET_ACCESS_KEY environment variable."
    exit 1
fi

if [ "${S3_BUCKET}" = "**None**" ]; then
    echo "You need to set the S3_BUCKET environment variable."
    exit 1
fi

if [ "${POSTGRES_DATABASE}" = "**None**" ]; then
    echo "You need to set the POSTGRES_DATABASE environment variable."
    exit 1
fi

if [ "${POSTGRES_HOST}" = "**None**" ]; then
    if [ -n "${POSTGRES_PORT_5432_TCP_ADDR}" ]; then
        POSTGRES_HOST=$POSTGRES_PORT_5432_TCP_ADDR
        POSTGRES_PORT=$POSTGRES_PORT_5432_TCP_PORT
    else
        echo "You need to set the POSTGRES_HOST environment variable."
        exit 1
    fi
fi

if [ "${POSTGRES_USER}" = "**None**" ]; then
    echo "You need to set the POSTGRES_USER environment variable."
    exit 1
fi

if [ "${POSTGRES_PASSWORD}" = "**None**" ]; then
    echo "You need to set the POSTGRES_PASSWORD environment variable or link to a container named POSTGRES."
    exit 1
fi


# Trigger either backup or restore
command=${1-backup}

if [ "$command" == "backup" ];
then
    source backup.sh
elif [ "$command" == "restore" ];
then
    source restore.sh
fi

