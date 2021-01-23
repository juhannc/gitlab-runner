#!/bin/bash

while [ $# -gt 0 ]; do
  case "$1" in
    --url=*)
      URL="${1#*=}"
      ;;
    --registration-token=*)
      TOKEN="${1#*=}"
      ;;
    --docker-image=*)
      DOCKER_IMAGE="${1#*=}"
      ;;
    --description=*)
      DESCRIPTION="${1#*=}"
      ;;
    --tag-list=*)
      TAGS="${1#*=}"
      ;;
    --run-untagged=*)
      RUN_UNTAGGED="${1#*=}"
      ;;
    --locked=*)
      LOCKED="${1#*=}"
      ;;
    --access-level=*)
      ACCESS_LEVEL="${1#*=}"
      ;;
    *)
      printf "***************************\n"
      printf "* Error: Invalid argument.*\n"
      printf "***************************\n"
      exit 1
  esac
  shift
done

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
  --run-untagged $RUN_UNTAGGED \
  --locked $LOCKED \
  --access-level $ACCESS_LEVEL
fi

# Run the runner
gitlab-runner run
