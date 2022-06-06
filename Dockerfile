FROM jenkins
USER root

RUN mkdir -p /tmp/download && \
  curl -L https://download.docker.com/linux/static/stable/x86_64/docker-20.10.9.tgz | tar -xz /tmp/download && \
  rem -rf /tmp/download/docker/dockerd && \
  mv /tmp/download/docker/docker* /usr/local/bin/ && \
  rm -rf /tmp/download && \
  groupadd -g 992 docker &&
  usermod -aG docker jenkins


USER jenkins
