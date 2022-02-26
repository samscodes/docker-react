FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

# Copy all files
COPY . .

RUN npm run build

FROM nginx
# When deploy expose to port 80 AWS
EXPOSE 3050
COPY --from=builder /app/build /usr/share/nginx/html