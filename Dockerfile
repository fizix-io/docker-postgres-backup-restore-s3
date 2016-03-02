FROM alpine:3.3
MAINTAINER Marteinn

ENV POSTGRES_DATABASE **None**
ENV POSTGRES_HOST **None**
ENV POSTGRES_PORT 5432
ENV POSTGRES_USER **None**
ENV POSTGRES_PASSWORD **None**
ENV POSTGRES_VERSION 9.4.6-r0
ENV S3_ACCESS_KEY_ID **None**
ENV S3_SECRET_ACCESS_KEY **None**
ENV S3_BUCKET **None**
ENV S3_REGION us-west-1
ENV S3_PATH 'backup'

ADD install.sh install.sh
RUN sh install.sh && rm install.sh

ADD run.sh run.sh
ADD backup.sh backup.sh
ADD restore.sh restore.sh

CMD ["sh", "run.sh", "backup"]
