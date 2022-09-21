FROM ubi8/nodejs-14

WORKDIR /app
RUN chmod +x /app

ENV APP_TO_RUN=$APP_TO_RUN

COPY entrypoint.sh /entrypoint.sh
 
# Add application sources
ADD . .

# Install the dependencies
RUN npm install

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 5173 5000

CMD ["npm", "run" , "$APP_TO_RUN"]


