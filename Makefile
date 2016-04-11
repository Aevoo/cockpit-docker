DOCKERHUB_USERNAME := aheinze
DOCKERHUB_REPOSITORY := cockpit
DOCKER_TAG := $(shell cd src && git describe --abbrev=0)

.PHONY: build master push push-master next push-next checkout login

build: master next

push: push-master push-next

master: checkout
	cd src && git checkout master && git pull
	docker build -t $(DOCKERHUB_USERNAME)/$(DOCKERHUB_REPOSITORY):$(DOCKER_TAG) .
	docker build -t $(DOCKERHUB_USERNAME)/$(DOCKERHUB_REPOSITORY):latest .

push-master: login
	docker push $(DOCKERHUB_USERNAME)/$(DOCKERHUB_REPOSITORY):$(DOCKER_TAG)
	docker push $(DOCKERHUB_USERNAME)/$(DOCKERHUB_REPOSITORY):latest

next: checkout
	cd src && git checkout next && git pull
	docker build -t $(DOCKERHUB_USERNAME)/$(DOCKERHUB_REPOSITORY):next .

push-next: login
	docker push $(DOCKERHUB_USERNAME)/$(DOCKERHUB_REPOSITORY):next

checkout:
	git submodule update --checkout

login:
	@docker login --email $(DOCKERHUB_EMAIL) --username $(DOCKERHUB_USERNAME) --password $(DOCKERHUB_PASSWORD)
