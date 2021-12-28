 snyk-fix-5ce268800f44bc66dc472c6622de2766
FROM node:12.20.1

FROM node:12.22
master

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

COPY . .

ENV PORT=${PORT:-3000}
USER 1000:1000

CMD ./node_modules/probot/bin/probot.js run --port $PORT ./index.js
