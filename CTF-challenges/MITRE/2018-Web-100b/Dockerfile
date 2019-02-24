FROM node

RUN mkdir /app
WORKDIR /app
COPY . .

RUN npm install

ENV NODE_ENV=production

EXPOSE 80
CMD node index.js $(cat flag.txt)
