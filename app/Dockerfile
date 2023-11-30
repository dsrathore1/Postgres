FROM node:lts-alpine3.18

WORKDIR /NODE_APP/app

COPY . .

RUN npm install

EXPOSE ${ND_PORT}

CMD [ "npm","start" ]