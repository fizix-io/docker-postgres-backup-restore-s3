# postgres-backup-restore-s3

Backup and restore PostgresSQL from S3

This dockerfile started out as a fork of the awesome [postgres-backup-s3](https://github.com/schickling/dockerfiles/tree/master/postgres-backup-s3), with a couple of changes:
- Added restore ability
- Made it possible to pin another postgres version in dockerfile
- Added so backup sends a current.sql.gz along with the timestamped backup
- Removed cron job (since I have no need for it)

## Usage

Docker:
```sh
$ docker run -e S3_ACCESS_KEY_ID=key -e S3_SECRET_ACCESS_KEY=secret -e S3_BUCKET=my-bucket -e S3_PREFIX=backup -e POSTGRES_DATABASE=dbname -e POSTGRES_USER=user -e POSTGRES_PASSWORD=password -e POSTGRES_HOST=localhost marteinn/postgres-backup-restore-s3
```

Docker Compose:
```yaml
postgres:
    image: postgres
    environment:
        POSTGRES_USER: user
        POSTGRES_PASSWORD: password

pgbackups3:
    image: marteinn/postgres-backup-restore-s3
    links:
        - postgres
    environment:
        S3_REGION: region
        S3_ACCESS_KEY_ID: key
        S3_SECRET_ACCESS_KEY: secret
        S3_BUCKET: my-bucket
        S3_PREFIX: backup
        POSTGRES_DATABASE: dbname
        POSTGRES_USER: user
        POSTGRES_PASSWORD: password
        POSTGRES_VERSION: 9.4.6-rc1
```

### Restoring backup

- Restore database from the latest backup
`docker-compose run db_backup sh run.sh restore`

- Restore database from a specific backup
`docker-compose run db_backup sh run.sh restore 2016-03-02T19:47:35Z`
