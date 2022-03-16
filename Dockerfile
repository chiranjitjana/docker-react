FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install
 
COPY . .

RUN npm run build #execute the build

FROM nginx

EXPOSE 80  #this expose command will expose the port 80 inside Elastick beanstalk container

COPY --folder=builder /app/build /usr/share/nginx/html  #copy all the content from build folder to nginx server container
