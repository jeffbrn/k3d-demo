#!/bin/bash

docker container stop registry.localhost
docker container rm registry.localhost
docker volume rm local_registry
