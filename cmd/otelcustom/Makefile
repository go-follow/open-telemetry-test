#include ./Makefile.Common
SHELL := /bin/bash
TAG = "v0.0.7"

#lint:
#	$(info ************ RUN LINTER ************)
#	golangci-lint run --verbose -c .golangci.yaml

generateComponents:
	$(info ************ RUN GENERATE COMPONENTS with --skip compilation ************)
	builder --skip-compilation --config=cmd/otelcustom/builder-config.yaml

build:
	$(info ************ RUN build docker image ************)
	env GOOS=linux GOARCH=amd64 go build -o otelcustom
	docker buildx build --platform linux/amd64 -f Dockerfile -t cartmanis/otel-custom:$(TAG) .
	docker push cartmanis/otel-custom:$(TAG)
