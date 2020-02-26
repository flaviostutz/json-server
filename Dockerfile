FROM node:13.8.0-alpine3.11

RUN npm install -g json-server js

ENV RESPONSE_DELAY_MS ''
ENV COLLECTIONS ''

EXPOSE 3000

WORKDIR /

# ADD db.json /
ADD init.js /
ADD startup.sh /

CMD [ "/startup.sh" ]
