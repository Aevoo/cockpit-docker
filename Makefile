DOCKERHUB_USERNAME := aheinze
DOCKERHUB_REPOSITORY := cockpit
DOCKER_TAG := $(shell cd src && git describe --abbrev=0)

.PHONY: build checkout push login next

build: checkout
	docker build -t $(DOCKERHUB_USERNAME)/$(DOCKERHUB_REPOSITORY):$(DOCKER_TAG) .
	docker build -t $(DOCKERHUB_USERNAME)/$(DOCKERHUB_REPOSITORY):latest .

checkout:
	git submodule update --checkout
	cd src && git checkout master

login:
	@docker login --email $(DOCKERHUB_EMAIL) --username $(DOCKERHUB_USERNAME) --password $(DOCKERHUB_PASSWORD)

push: login
	docker push $(DOCKERHUB_USERNAME)/$(DOCKERHUB_REPOSITORY):$(DOCKER_TAG)
	docker push $(DOCKERHUB_USERNAME)/$(DOCKERHUB_REPOSITORY):latest

next: checkout
	cd src && git checkout next
	docker build -t $(DOCKERHUB_USERNAME)/$(DOCKERHUB_REPOSITORY):next .
	docker push $(DOCKERHUB_USERNAME)/$(DOCKERHUB_REPOSITORY):next
