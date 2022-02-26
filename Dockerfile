#FROM node:alpine AS builder
#
#WORKDIR '/app'
#
#COPY package.json .
#
#RUN npm install
#
## Copy all files
#COPY . .
#
#RUN npm run build
#
#FROM nginx
## When deploy expose to port 80 AWS
#EXPOSE 80
#COPY --from=builder /app/build /usr/share/nginx/html
#

FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html