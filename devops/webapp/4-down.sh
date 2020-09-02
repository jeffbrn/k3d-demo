#!/bin/bash

kubectl delete -f app-web-deployment.yaml
kubectl delete -f secret.yaml
docker network disconnect k3d-app1 registry.localhost
k3d cluster delete app1
rm secret.yaml

