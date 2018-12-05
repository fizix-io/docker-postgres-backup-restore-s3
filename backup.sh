#! /bin/sh
set -e

backup_name=${2-latest}

echo "Creating dump of ${PGHOST} database..."

pg_dumpall $PG_DUMPALL_OPTIONS | gzip > dump.sql.gz

echo "Uploading dump to $S3_BUCKET"

cat dump.sql.gz | aws s3 cp - s3://$S3_BUCKET/$S3_PREFIX/${backup_name}.sql.gz || exit 2

echo "SQL backup uploaded successfully"
