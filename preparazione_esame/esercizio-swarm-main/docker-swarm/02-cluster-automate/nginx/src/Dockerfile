FROM node:16-alpine

WORKDIR /app

COPY hostname.js .

RUN npm install

CMD ["node", "hostname.js"]