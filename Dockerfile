FROM gitlab/gitlab-runner
MAINTAINER Johann Lange <johannlange@yahoo.de>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install bash -y
RUN apt-get clean

# Register the gitlab-runner
ENTRYPOINT echo $URL && echo $TOKEN
