FROM node:20-slim

WORKDIR /fal-js

COPY ./package*.json ./

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 make g++

RUN npm ci
COPY . .
RUN npm run build client

WORKDIR /fal-js/dist/libs/client
RUN npm pack && mv fal-ai-client-*.tgz /tmp/client.tgz