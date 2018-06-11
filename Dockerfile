FROM pando85/armhf-ubuntu-qemu
RUN ["cross-build-start"]

MAINTAINER Sasha Gerrand <github+docker-glibc-builder@sgerrand.com>
ENV PREFIX_DIR /usr/glibc-compat
ENV GLIBC_VERSION 2.27
RUN apt-get -q update \
	&& apt-get -qy install bison build-essential wget openssl gawk
COPY configparams /glibc-build/configparams
COPY builder /builder
ENTRYPOINT ["/builder"]

RUN ["cross-build-end"]
