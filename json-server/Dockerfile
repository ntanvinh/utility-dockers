FROM node:12-alpine

WORKDIR /server

COPY ./package.json .

RUN npm install

ENV port=3000

ENV delay=0

ENV db="db.json"

ENV routes=""

EXPOSE ${port}

ENTRYPOINT [ "sh", "-c", "/server/node_modules/.bin/json-server --port ${port} --delay ${delay} --host 0.0.0.0 --routes ${routes} --watch ${db}" ]
