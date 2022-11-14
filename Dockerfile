# build stage
FROM registry.access.redhat.com/ubi8/nodejs-16 as build-stage
USER root
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build \
 && chown -R 1001:1001 . \
 && chmod -R 777 .

# production stage
FROM nginxinc/nginx-unprivileged:stable-alpine as production-stage
USER 1001
COPY --from=build-stage /app/dist /usr/share/nginx/html

EXPOSE 5173 5000




