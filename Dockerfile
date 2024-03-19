FROM node:18-alpine as BUILD_IMAGE
WORKDIR /app/vue-app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM node:18-alpine as STAGING_IMAGE
WORKDIR /app/vue-app

COPY --from=BUILD_IMAGE /app/vue-app/dist/ /app/vue-app/dist/
EXPOSE 8080
COPY package.json .
COPY vite.config.js .
RUN npm install typescript
CMD ["npm", "run", "preview"]