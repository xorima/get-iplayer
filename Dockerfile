
FROM ubuntu:20.04

LABEL maintainer="Xorima"
ARG BUILD_DATE
ARG VCS_REF
ARG GET_IPLAYER_VERSION

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="Xorima/get-iplayer"
LABEL org.label-schema.description="get_iplayer bundled in a docker container"
LABEL org.label-schema.vcs-url="https://github.com/Xorima/get-iplayer"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="Xorima"
LABEL org.label-schema.version=$GET_IPLAYER_VERSION
LABEL org.label-schema.docker.cmd="docker run -v ~/.get_iplayer:/config -v ~/video:/data -p 1935:1935 -d xorima/get-iplayer --config-dir=/config --output=/data pvr"
LABEL org.label-schema.docker.cmd.help="docker run -v ~/.get_iplayer:/config -v ~/video:/data -p 1935:1935 -d xorima/get-iplayer --help"

#Setup Repos
RUN \
  apt update && \
  apt-get install -y software-properties-common --no-install-recommends && \
  add-apt-repository ppa:m-grant-prg/utils && \
  apt-get update && \
  apt-get install -y get-iplayer=${GET_IPLAYER_VERSION}-* --no-install-recommends && \
# cleanup
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

# ports and volumes
EXPOSE 1935

ENTRYPOINT [ "get-iplayer"]
