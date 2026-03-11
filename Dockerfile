FROM node:25-trixie


WORKDIR /app

COPY . .

RUN cd ws-server && npm ci
RUN npm install -g serve
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 3000
EXPOSE 3344

CMD ["/start.sh"]
