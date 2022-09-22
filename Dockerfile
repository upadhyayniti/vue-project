FROM ubi8/nodejs-14

ENV APP_TO_RUN=$APP_TO_RUN

COPY entrypoint.sh /entrypoint.sh
 
# Add application sources
ADD . .

# Install the dependencies
RUN npm install

RUN useradd node -g 0

RUN mkdir 'node_modules/.vite' && mkdir 'node_modules/.vite/deps_temp' && mkdir 'node_modules/.vite/deps' 

USER node

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 5173 5000

CMD npm run $APP_TO_RUN


