
lint:
	$(info ************ RUN LINTER ************)
	golangci-lint run --verbose -c .golangci.yaml
