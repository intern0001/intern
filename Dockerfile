FROM node:14

WORKDIR /usr/src/app

RUN npm install
RUN npm install express ejs

COPY   ./app .

EXPOSE 3000

CMD ["node", "app.js"]
