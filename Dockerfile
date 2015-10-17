# DOCKER-VERSION 1.6.2
#
# Node.js Dockerfile
#
# https://github.com/richardkdrew/docker-nodejs
#

FROM debian:jessie

MAINTAINER Richard Drew <richardkdrew@gmail.com>

ENV NODE_VERSION=0.12.7 \
	NPM_VERSION=2.14.1

# install dependencies
RUN buildDeps='curl build-essential ca-certificates' \
	&& apt-get update \
	&& apt-get install -y $buildDeps --no-install-recommends \
	&& apt-get clean

# install node
		# verify gpg and sha256: http://nodejs.org/dist/v0.10.30/SHASUMS256.txt.asc
		# gpg: aka "Timothy J Fontaine (Work) <tj.fontaine@joyent.com>"
		# gpg: aka "Julien Gilli <jgilli@fastmail.fm>"
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 7937DFD2AB06298B2293C3187D33FF9D0246406D 114F43EE0176B71C7BC219DD50A3051F888C628D \
	&& curl -sSLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
	&& curl -sSLO "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
	&& gpg --verify SHASUMS256.txt.asc \
	&& grep " node-v$NODE_VERSION-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c - \
	&& tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
	&& rm "node-v$NODE_VERSION-linux-x64.tar.gz" SHASUMS256.txt.asc \
# install npm
	&& npm install -g npm@"$NPM_VERSION" \
    && npm cache clear \
# do some clean-up
    && apt-get purge -y --auto-remove $buildDeps \
    && rm -rf /var/lib/apt/lists/*

CMD ["node"]
