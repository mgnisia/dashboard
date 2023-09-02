FROM node:lts AS build

WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install

COPY . ./
RUN yarn build

FROM nginx:1.25.2
COPY --from=build /app/build /app
COPY nginx.conf /etc/nginx/nginx.conf