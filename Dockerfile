FROM node:lts-alpine

# tini: proper PID 1 init process
# git: for identification of ADR editors
RUN apk add --no-cache tini git

USER node
# install log4brains
RUN --mount=type=cache,target=/home/node/.cache,sharing=locked,uid=1000 \
    yarn global add log4brains
ENV PATH=/home/node/.yarn/bin:$PATH
# fix log4brains build using newer node versions

ENV NODE_OPTIONS=--openssl-legacy-provider

WORKDIR /workdir
ENTRYPOINT [ "tini", "-v", "--", "log4brains" ]
CMD [ "preview", "--no-open" ]
EXPOSE 4004

# preview:  docker run -it --rm -v .:/workdir -p 4004:4004 <image>
# build: docker run -it --rm -v .:/workdir <image> build --basePath /madr-poc/.log4brains/out
# b4GH:  docker run -it --rm -v .:/workdir <image> build --basePath /MFD/InterTest-server
