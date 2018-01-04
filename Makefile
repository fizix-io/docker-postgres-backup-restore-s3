NAME = marteinn/postgres-backup-restore-s3

build:
	docker build -t $(NAME):9.4.15 --rm --build-arg POSTGRES_VERSION==9.4.15-r0 --build-arg ALPINE_VERSION=3.3 .
	docker build -t $(NAME):9.5.10 --rm --build-arg POSTGRES_VERSION==9.5.10-r0 --build-arg ALPINE_VERSION=3.4 .
	docker build -t $(NAME):9.6.6 --rm --build-arg POSTGRES_VERSION==9.6.6-r0 --build-arg ALPINE_VERSION=3.5 .
	docker build -t $(NAME):10.1 --rm --build-arg POSTGRES_VERSION==10.1-r1 --build-arg ALPINE_VERSION=3.7 .

	docker tag $(NAME):9.4.15 $(NAME):9.4
	docker tag $(NAME):9.5.10 $(NAME):9.5
	docker tag $(NAME):9.6.6 $(NAME):9.6
	docker tag $(NAME):9.6.6 $(NAME):9
	docker tag $(NAME):10.1 $(NAME):10
	docker tag $(NAME):10.1 $(NAME):latest

push:
	docker push $(NAME):9.4.15
	docker push $(NAME):9.4
	docker push $(NAME):9.5.10
	docker push $(NAME):9.5
	docker push $(NAME):9.6.6
	docker push $(NAME):9.6
	docker push $(NAME):9
	docker push $(NAME):10
	docker push $(NAME):latest
