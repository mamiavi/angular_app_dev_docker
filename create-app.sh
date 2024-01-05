#!/bin/bash

echo "What's the app name?"
read APP_NAME

docker build . --file create.Dockerfile --tag angular-app --build-arg APP_NAME=$APP_NAME
docker run --name running-app angular-app
docker cp running-app:/app/$APP_NAME .
docker stop running-app
docker rm running-app
sed -i "s/%%%%/$APP_NAME/g" dev_docker-compose.yml
cp dev_docker-compose.yml ./$APP_NAME/docker-compose.yml
cp dev_Dockerfile ./$APP_NAME/Dockerfile
sed -i "s/ng serve/ng serve --host 0.0.0.0  --poll 500/g" ./$APP_NAME/package.json

# Remove all files
rm -rdf .git
rm create.Dockerfile
rm dev_docker-compose.yml
rm dev_Dockerfile
rm README.md
rm create-app.sh