#!/bin/bash

# Register the gitlab-runner
if ! grep -q $URL /etc/gitlab-runner/config.toml;
then
  gitlab-runner register \
  --non-interactive \
  --url $URL \
  --registration-token $TOKEN \
  --executor "docker" \
  --docker-image $DOCKER_IMAGE \
  --description $DESCRIPTION \
  --tag-list $TAGS \
  --run-untagged=$RUN_UNTAGGED \
  --locked=$LOCKED \
  --access-level=$ACCESS_LEVEL
fi

# Run the runner
gitlab-runner run
