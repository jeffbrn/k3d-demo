#!/bin/bash

U=`logname`
k3d cluster create app1 -p 8080:31080@loadbalancer --volume $PWD/reg/registries.yaml:/etc/rancher/k3s/registries.yaml --agents 3
echo "Changing kube config owner to ${U}"
chown $U ~/.kube/config
docker network connect k3d-app1 registry.localhost
kubectl create -f app-web-deployment.yaml
watch -n 1 kubectl get po
