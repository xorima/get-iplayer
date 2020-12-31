
FROM ubuntu:20.04

LABEL maintainer="Xorima"

#Setup Repos
RUN \
  apt update && \
  apt-get install -y software-properties-common --no-install-recommends && \
  add-apt-repository ppa:m-grant-prg/utils && \
  apt-get update && \
  apt-get install -y get-iplayer --no-install-recommends && \
# cleanup
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

# ports and volumes
EXPOSE 1935

ENTRYPOINT [ "get-iplayer"]
