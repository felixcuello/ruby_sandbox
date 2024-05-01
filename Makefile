plot:
	@echo ""
	@echo "-------------------------------------------------------------------------------"
	@echo "  💡 Help  🧠"
	@echo "-------------------------------------------------------------------------------"
	@echo ""
	@echo " Options: "
	@echo "   make                           # Show this message"
	@echo "   make build                     # Build container"
	@echo "   make shell                     # Enter a shell inside the container"
	@echo ""

CONTAINER_TAG := ruby_sandbox
APP_DIR := $(shell pwd)

# Build the container -----------------------------------------------------------------------------
build:
	@echo "Building container [tag: ${CONTAINER_TAG}]..."
	@docker build -t ${CONTAINER_TAG} .


# Enter a shell inside the container --------------------------------------------------------------
shell:
	@docker run -ti --rm \
		-v ${APP_DIR}:/app \
		-v ${HOME}/.ssh:/root/.ssh \
		-v ${HOME}/.github-token:/root/.github-token \
		-v ${PWD}/.vimrc:/root/.vimrc \
		${CONTAINER_TAG} /bin/bash

