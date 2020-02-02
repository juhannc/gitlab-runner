FROM gitlab/gitlab-runner
MAINTAINER Johann Lange <johannlange@yahoo.de>

# RUN apt-get update && && sudo apt-get upgrade && apt-get clean

# Register the gitlab-runner
CMD gitlab-runner register \
  --non-interactive \
  --url $URL \
  --registration-token $TOKEN \
  --executor "docker" \
  --docker-image $IMAGE \
  --description $DESCRIPTION \
  --tag-list $TAGS \
  --run-untagged=$RUN_UNTAGGED \
  --locked=$LOCKED \
  --access-level=$ACCESS_LEVEL
