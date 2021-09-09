DIRECTORIES = infrastructure

.PHONY: $(DIRECTORIES)

$(DIRECTORIES):
	COMMIT_TAG=jrcasso/$(DIRECTORIES):`git rev-parse --short HEAD`; \
	CONTEXT=$(DIRECTORIES)/; \
	DOCKERFILE=$(DIRECTORIES)/Dockerfile; \
	docker build --no-cache $$CONTEXT -f $$DOCKERFILE -t $$COMMIT_TAG; \
	docker push $$COMMIT_TAG; \
	if [ "$$tag" != "" ]; then \
		TAG=jrcasso/$(DIRECTORIES):$$tag; \
		docker tag $$COMMIT_TAG $$TAG; \
		docker push $$TAG; \
	fi \
