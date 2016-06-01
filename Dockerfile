FROM node:0.12

# Dockerfile author/maintainer
MAINTAINER Saidimu Apale (saidimu@gmail.com)

## limitd releases: https://github.com/auth0/limitd/releases
ENV LIMITD_VERSION v4.17.2
# ENV LIMITD_URL https://codeload.github.com/auth0/limitd/tar.gz/${LIMITD_VERSION}
ENV LIMITD_URL https://github.com/auth0/limitd/archive/${LIMITD_VERSION}.tar.gz
RUN mkdir -p /data

RUN curl -SL ${LIMITD_URL} -o limitd.tar.gz \
    && tar -xf limitd.tar.gz --strip-components=1 \
    && npm install \
    && rm limitd.tar.gz

VOLUME /data

EXPOSE 9001

CMD ./bin/limitd --config-file /data/limitd.yml
