#!/bin/bash

kubectl delete -f timescale-deployment.yaml
kubectl delete -f secret.yaml
kubectl delete -f vols.yaml
k3d cluster delete ts
rm -r /tmp/ts_k3dvol/
