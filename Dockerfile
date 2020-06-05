FROM node:alpine as builder
WORKDIR '/usr/apps/react_app'
COPY package.json .
RUN yarn
COPY . .
RUN yarn run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/apps/react_app/build /usr/share/nginx/html
