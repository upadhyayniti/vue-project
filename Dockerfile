FROM node:12

ENV APP_TO_RUN=$APP_TO_RUN

COPY entrypoint.sh /entrypoint.sh

COPY package*.json ./

RUN npm install

RUN mkdir 'node_modules/.vite' 

COPY . .

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 5173 5000

CMD npm run $APP_TO_RUN




