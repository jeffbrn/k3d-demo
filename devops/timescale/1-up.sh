#!/bin/bash

# create the directory to host the database persistent volume
mkdir -p /tmp/ts_k3dvol
# get the logged in user's username
U=`logname`
# create the cluster and setup the cluster load balancer to handle traffic to the database service
k3d cluster create ts -p 5432:31432@loadbalancer --volume /tmp/ts_k3dvol:/tmp/ts_k3dvol --agents 1
echo "Changing kube config owner to ${U}"
chown $U ~/.kube/config
# Setup the persistent volume for the cluster
kubectl apply -f vols.yaml
# Add the pod secrets to the cluster
kubectl apply -f secret.yaml
# Startup the pods and the service entrypoint
kubectl create -f timescale-deployment.yaml
# Show the user the pods starting up. NOTE depending on the resources of the machine this could take some time
watch -n 1 kubectl get po
