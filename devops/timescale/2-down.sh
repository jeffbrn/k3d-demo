#!/bin/bash

kubectl delete -f timescale-deployment.yaml
k3d cluster delete ts
