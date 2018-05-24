#! /bin/sh
set -e

# name of the backup file requested for restore
backup_name=${2-latest}

echo "Restoring db dump"

echo "Downloading dump $backup_name.sql.gz from $S3_BUCKET"

aws s3 cp s3://$S3_BUCKET/$S3_PREFIX/$backup_name.sql.gz dump.sql.gz || exit 2

gunzip -c dump.sql.gz | psql

echo "SQL backup restored successfully"
