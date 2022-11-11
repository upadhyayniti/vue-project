FROM quay.io/polyglotsystems/ubi8-nginx:latest

ENV APP_TO_RUN=$APP_TO_RUN

USER root

# Add application sources
ADD . .

COPY container-root/ /

COPY . /var/www/html

# Install the dependencies
RUN npm install \
 && npm run build \
 && chown -R 1001:1001 . \
 && chmod -R 777 .

RUN mkdir 'node_modules/.vite' 

ENTRYPOINT ["/entrypoint.sh"]

USER 1001

EXPOSE 5173 5000



