FROM golang:latest AS builder

COPY . .
RUN go build main.go


FROM debian:11-slim
LABEL org.opencontainers.image.authors="admin@itsmeniduka.engineer"
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends -y ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENV TZ=Asia/Tehran

VOLUME [ "/etc/x-ui" ]
CMD [ "bash" , "install.sh" ]
