IMAGE_NAME  := pokerl-map-viz
IMAGE_TAG   := latest
PLATFORMS    := linux/amd64,linux/arm64
PLATFORM ?= linux/amd64
DOCKERFILE  := Dockerfile
REGISTRY := harbor.yanello.net/library

.PHONY: build run clean help

build:
	docker buildx build \
		--platform $(PLATFORMS) \
		--tag $(REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG) \
		--push \
		--file $(DOCKERFILE) \
		.

run:
	docker run --rm \
		--platform $(PLATFORM) \
		$(IMAGE_NAME):$(IMAGE_TAG) $(ARGS)

clean:
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG)

help:
	@grep -E '^##' $(MAKEFILE_LIST) | sed 's/## //'
