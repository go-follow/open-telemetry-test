#include ./Makefile.Common
SHELL := /bin/bash
TAG = "v0.0.6"

#lint:
#	$(info ************ RUN LINTER ************)
#	golangci-lint run --verbose -c .golangci.yaml

generateComponents:
	$(info ************ RUN GENERATE COMPONENTS with --skip compilation ************)
	builder --skip-compilation --config=cmd/otelcustom/builder-config.yaml

build:
	$(info ************ RUN build docker image ************)
	docker buildx build --platform linux/amd64 -f ./cmd/otelcustom/Dockerfile -t cartmanis/otel-custom:$(TAG) .
	docker push cartmanis cartmanis/otel-custom:$(TAG)
