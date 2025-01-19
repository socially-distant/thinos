FROM ghcr.io/socially-distant/sericea-main:latest

# Fedora base image: quay.io/fedora/fedora-bootc:41
# CentOS base images: quay.io/centos-bootc/centos-bootc:stream10

COPY ./build.sh /tmp/build.sh
COPY just /tmp/just/

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit && \
    bootc container lint

