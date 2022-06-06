FROM jenkins/jenkins
USER root

RUN mkdir -p /tmp/download && \
  export DEBIAN_FRONTEND=noninteractive && \
  curl -L https://download.docker.com/linux/static/stable/x86_64/docker-20.10.9.tgz | tar -xz -C /tmp/download && \
  rm -rf /tmp/download/docker/dockerd && \
  mv /tmp/download/docker/docker* /usr/local/bin/ && \
  rm -rf /tmp/download && \
  #apt-get update && apt-get -yq install liblinux-usermod && \
  groupadd -g 992 docker && \
  usermod -aG docker jenkins


USER jenkins
