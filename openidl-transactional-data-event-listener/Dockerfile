FROM node:14.17-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache \
    bash \
    git \
    python \
    make \
    g++


COPY . .
RUN rm -rf node_modules
RUN npm install
RUN rm -rf .npmrc
EXPOSE 8080
CMD [ "npm","run","start"]