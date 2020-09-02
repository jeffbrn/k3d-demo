#!/bin/bash

kubectl delete -f timescale-deployment.yaml
kubectl delete -f secret.yaml
kubectl delete -f vols.yaml
k3d cluster delete ts
# Remove database persisted data
rm -r /tmp/ts_k3dvol/
# Remove secrets
rm secret.yaml
