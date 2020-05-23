FROM node:alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
# this command is to get things working on AWS Beanstalk
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html