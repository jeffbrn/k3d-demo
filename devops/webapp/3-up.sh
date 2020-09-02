#!/bin/bash

# get the logged in user's username
U=`logname`
# create the cluster and setup the cluster load balancer to handle traffic fo the webapp service
k3d cluster create app1 -p 8080:31080@loadbalancer --volume $PWD/reg/registries.yaml:/etc/rancher/k3s/registries.yaml --agents 3
echo "Changing kube config owner to ${U}"
chown $U ~/.kube/config
# Setup a route from the cluster to your docker registry
docker network connect k3d-app1 registry.localhost
# Add the pod secrets to the cluster
kubectl apply -f secret.yaml
# Startup the pods and the service entrypoint
kubectl create -f app-web-deployment.yaml
# Show the user the pods starting up. NOTE depending on the resources of the machine this could take some time
watch -n 1 kubectl get po
