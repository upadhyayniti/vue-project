FROM node:16

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

RUN echo $(ls -1 /usr/share/nginx/html)

RUN echo $(ls -1 /app/dist)

EXPOSE 5173 5000




