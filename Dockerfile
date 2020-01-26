FROM gitlab/gitlab-runner
MAINTAINER Johann Lange <johannlange@yahoo.de>

RUN gitlab-runner register \
  --non-interactive \
  --url $url \
  --registration-token $token \
  --executor "docker" \
  --docker-image $image \
  --description $name \
  --tag-list $tags \
  --run-untagged=$untagged \
  --locked=$locked \
  --access-level=$acces
