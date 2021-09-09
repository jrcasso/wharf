.PHONY: infrastructure

infrastructure:
	# Build, tag with current commit, and push all Dockerfiles in first-level directories
	# Note: repository must exist in Dockerhub for the push to succeed
	for d in */ ; do \
		COMMIT_TAG=jrcasso/$${d/\//}:`git rev-parse --short HEAD`; \
		CONTEXT=$${d/\//}/; \
		DOCKERFILE=$${d/\//}/Dockerfile; \
		docker build --no-cache $$CONTEXT -f $$DOCKERFILE -t $$COMMIT_TAG; \
		docker push $$COMMIT_TAG; \
		if [ "$$tag" != "" ]; then \
			docker tag $$tag; \
			docker push $$tag; \
		fi \
	done
