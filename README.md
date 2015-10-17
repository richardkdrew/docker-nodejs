# NodeJS (JavaScript runtime built on Chrome's V8 JavaScript engine)

For more information about NodeJS look [here] (https://nodejs.org/).

## Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/richardkdrew/nodejs/) from public [Docker Hub Registry](https://registry.hub.docker.com/):

```sh
docker pull richardkdrew/nodejs
```

OR

Build a local image from the Dockerfile source:

```sh
docker build -t richardkdrew/nodejs github.com/richardkdrew/docker-nodejs
```