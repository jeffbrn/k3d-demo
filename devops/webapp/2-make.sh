#!/bin/bash

run_env=staging

docker rmi registry.localhost:5000/app-web-img:$run_env
docker rmi app-web-img:$run_env
docker rmi app-web-img

mount --bind ../../src src
docker build --build-arg run_environment="${run_env}" -t app-web-img .
umount src

docker tag app-web-img:latest app-web-img:$run_env
docker tag app-web-img:$run_env registry.localhost:5000/app-web-img:$run_env
docker push registry.localhost:5000/app-web-img:$run_env

