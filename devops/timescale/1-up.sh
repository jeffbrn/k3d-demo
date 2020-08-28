#!/bin/bash

U=`logname`
k3d cluster create ts -p 5432:31432@loadbalancer --volume /tmp/ts_k3dvol:/tmp/ts_k3dvol --agents 1
echo "Changing kube config owner to ${U}"
chown $U ~/.kube/config
kubectl apply -f vols.yaml
kubectl create -f timescale-deployment.yaml
