FROM ubi8/nodejs-16

WORKDIR /app

COPY entrypoint.sh /entrypoint.sh

ADD . .

RUN npm install

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 5173 5000

CMD ["/bin/bash"]
