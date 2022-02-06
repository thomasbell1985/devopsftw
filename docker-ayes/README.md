# About

This repository contains all of the elements necessary to build a litecoin image based on litecoin version 0.18.1. In addition to a Dockerfile there is a kubernetes statefulset specification at:

```sh
k8s-litecoin-stateful-set.yaml
```

This repository contains the public key for litecoin to verify the installation, and this key was retrieved from:

```sh
https://pgp.mit.edu/pks/lookup?op=get&search=0xFE3348877809386C
```

## Running the Jenkins Pipeline

The ```Jenkinsfile``` in the root of this repository depends on a service account called 'Jenkins' that has the permissions defined in:

```sh
jenkins-kubernetes/service_account.yaml
```

Assuming you have a valid kubernetes installation you can run the following command to provision the Jenkins instance:

```sh
kubectl apply -f jenkins-kubernetes
```

This will provision all necessary components for the jenkins instance. 

You will then need to configure the [kubernetes cloud plugin](https://plugins.jenkins.io/kubernetes/) on the Jenkins installation.