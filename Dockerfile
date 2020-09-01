FROM openjdk:8-alpine

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories; \
        apk update; \
        apk add --no-cache sbt@testing apache-ant maven

ENV BUILD_DIR=/build
RUN addgroup -S build && adduser -S build -G build && mkdir $BUILD_DIR && chmod 755 $BUILD_DIR && chown -R build:build $BUILD_DIR && chmod -R g+rw $BUILD_DIR
USER build
WORKDIR $BUILD_DIR

RUN sbt -sbt-version 1.3.13 sbtVersion