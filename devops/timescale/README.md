# Timescale Database Deployment

This example deploys a timescale database with a persistent volume and a loadbalancer to allow external connections

## Files

* 1-up.sh						- Script that creates the cluster and deploys the database
* 2-down.sh					- Script that tears down the cluster
* vols.yaml					- Provisioning doc for the persistent storage used
* timescale-deployment.yaml	- Provisioning doc for the pod and service
* secret.yaml					- Provisioning doc for the Postgres administrator password

## Persistant Storage

The volume is created and is mapped to the directory /tmp/ts_k3dvol on the docker host machine.

When the cluster is torn down, the contents of the directory are untouched so that the database state and data will remain even if the cluster is removed.

The result being that data is not lost when the cluster is torn down and the database will come back up without data loss if the cluster is recreated.

## Postgres Password

The secret.yaml file holds the Postgres administrator password that is to be injected into the running pod.
The secrets must be base64 encoded this can be done at the commandline by:

```
$ echo -n "mypassword" | base64
```

The encoded value is then shown which can then be copied and pasted into the secret.yaml file.

