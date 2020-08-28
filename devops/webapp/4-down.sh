#!/bin/bash

kubectl delete -f app-web-deployment.yaml
docker network disconnect k3d-app1 registry.localhost
k3d cluster delete app1

