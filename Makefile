IMAGE_NAME  := pokerl-map-viz
IMAGE_TAG   := latest
PLATFORMS    := linux/amd64,linux/arm64
PLATFORM ?= linux/amd64
DOCKERFILE  := Dockerfile
REGISTRY := harbor.yanello.net/library

.PHONY: build run clean help

## build: Build the Docker image for linux/amd64
build:
	docker buildx build \
		--platform $(PLATFORMS) \
		--tag $(REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG) \
		--push \
		--file $(DOCKERFILE) \
		.

## run: Run the container (override CMD with ARGS="..." if needed)
run:
	docker run --rm \
		--platform $(PLATFORM) \
		$(IMAGE_NAME):$(IMAGE_TAG) $(ARGS)

## clean: Remove the built image
clean:
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG)

## help: Show this help message
help:
	@grep -E '^##' $(MAKEFILE_LIST) | sed 's/## //'
