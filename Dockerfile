FROM node:20-alpine AS builder

ENV NODE_ENV=production

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

FROM node:20-alpine

ENV NODE_ENV=production

WORKDIR /app

COPY --from=builder /app .

USER node

EXPOSE 3000

# Start the web server
CMD ["node", "./bin/www"]
