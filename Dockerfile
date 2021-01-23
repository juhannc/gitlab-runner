FROM gitlab/gitlab-runner
LABEL maintainer="Johann Lange <johannlange@yahoo.de>"

COPY register.bash /register.bash

# Register the gitlab-runner if not exist
ENTRYPOINT /register.bash
