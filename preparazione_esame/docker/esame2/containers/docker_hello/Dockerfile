FROM node:lts-alpine

WORKDIR ./src /app
COPY . .

ARG PORT
EXPOSE $PORT

ENV NODE_ENV_PORT=${PORT}

ENTRYPOINT ["node", "src/main.js"]
