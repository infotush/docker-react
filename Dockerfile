FROM node:14.18.0-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

