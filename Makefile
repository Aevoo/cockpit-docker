DOCKER_REPOSITORY := cockpit
DOCKER_TAG := $(shell cd src && git describe --abbrev=0)

.PHONY: build checkout

build: checkout
	docker build -t $(DOCKER_REPOSITORY):$(DOCKER_TAG) .
	docker build -t $(DOCKER_REPOSITORY):latest .

checkout:
	git submodule update --checkout
