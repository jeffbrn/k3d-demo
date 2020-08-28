# K3D Test Repository

## Installing K3D

First docker must be [installed](https://docs.docker.com/engine/install/ubuntu)

For K3D installation instructions see [here](https://k3d.io/#installation)

You will need kubectl [installed](https://kubernetes.io/docs/tasks/tools/install-kubectl/)


## Repo Layout

src - C# test web project to deploy
devops - Files for testing k3d deployments
devops/timescale - Test deployment for a timescale database with a persistent volume example
devops/webapp - Test deployment for a distributed web app that demonstrates the k3d loadbalancer and pulling from a local docker repo
