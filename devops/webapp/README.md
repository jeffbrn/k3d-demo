# Run Application stack

This example deploys a simple web app distributed across 3 nodes with a load balancer.

## Files

* 1-add-reg.sh				- Runs a local docker repo for deploying images to k3d
* 2-make.sh					- Builds the web app and preps it for deployment
* 3-up.sh						- Script that creates the cluster and deploys the web app
* 4-down.sh					- Script that tears down the cluster
* 5-rem-reg.sh				- Removes the local docker repo
* Dockerfile					- Dockerfile that build the webapp image for deployment
* reg/registries.yaml			- Provisioning that allows k3d to connect to the local docker repository
* app-web-deployment.yaml		- Provisioning doc for the pod and service
* secret.yaml				- Provisioning doc for the secrets to be injected into the pods


## Local docker repo

A local docker repo is deployed and uses the address repository.localhost

This resolves to localhost because ubuntu automatically maps *.localhost to 127.0.0.1

The registries.yaml tells k3d that this is a valid registry and will pull images from it.

## Generating Injected Secrets

The secret.yaml.gpg is an encrypted file that holds the secrets used by the cluster.
During the 'up' script the user will be prompted for the password to decrypt the secrets file before it is uploaded into the cluster.

The password to decrypt is: _Ggzdac219!_

If the password is correct the file is decrypted and put into *secret.yaml*

To encrypt the original file the command is:

```
$ gpg -c secret.yaml
```

The secret.yaml file holds the secrets to be injected into the running pods.
The secrets must be base64 encoded this can be done at the commandline by:

```
$ echo -n "mypassword" | base64
```

The encoded value is then shown which can then be copied and pasted into the secret.yaml file.

## Testing the website

Open up a browser and navigate to http://<docker system ipaddress>:8080
and a webpage comes up with some information about where the page was served from
