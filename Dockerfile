FROM gitlab/gitlab-runner
MAINTAINER Johann Lange <johannlange@yahoo.de>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install bash -y
RUN apt-get clean

# Register the gitlab-runner
ENTRYPOINT gitlab-runner register \
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
