#! /bin/sh
set -e

# update
apk update

apk add postgresql${POSTGRES_VERSION}

echo "pg_dump version:"
pg_dump -V

# install s3 tools
apk add python py-pip
pip install awscli
apk del py-pip

# cleanup
rm -rf /var/cache/apk/*
