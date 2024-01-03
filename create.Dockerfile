FROM node:latest
ARG APP_NAME
WORKDIR /app
RUN npm install -g @angular/cli
RUN ng new $APP_NAME --skip-git