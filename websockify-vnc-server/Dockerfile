FROM node:13-alpine

WORKDIR /server

COPY package.json .

RUN npm install

COPY websockifyServer.js .

ENV vncIp=""

ENV vncPort=5900

ENV wsPort=7900

ENTRYPOINT vncIp=${vncIp} && vncPort=${vncPort} && wsPort=${wsPort} && node websockifyServer.js