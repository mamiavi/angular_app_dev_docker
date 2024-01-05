FROM node:latest
ARG APP_NAME
WORKDIR /app
RUN npm cache clean --force
RUN npm install -g @angular/cli
RUN ng new $APP_NAME --skip-git