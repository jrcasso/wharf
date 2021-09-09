images:
	# Build, tag with current commit, and push all Dockerfiles in first-level directories
	# Note: repository must exist in Dockerhub for the push to succeed
	for d in */ ; do \
		CONTEXT=$${d/\//}/; \
		DOCKERFILE=$${d/\//}/Dockerfile; \
		TAG=jrcasso/$${d/\//}:`git rev-parse --short HEAD`; \
		docker build --no-cache $$CONTEXT -f $$DOCKERFILE -t $$TAG; \
		docker push $$TAG; \
	done
