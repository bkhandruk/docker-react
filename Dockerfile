FROM node:alpine
WORKDIR '/usr/apps/react_app'
COPY package.json .
RUN yarn
COPY . .
RUN yarn run build

FROM nginx
EXPOSE 80
COPY --from=0 /usr/apps/react_app/build /usr/share/nginx/html
