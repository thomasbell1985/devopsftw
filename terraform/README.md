# About

This folder contains all of the necessary components to provision resources in AWS. You can run this terraform and it will provision the following items in aws:

* A group called 'devops_team'
* A user named 'bob' who will be a member of the 'devops_team'
* A role called 'devops_role'
* A policy allowing users to assume the devops_role

## Pre-requisites

* [Terraform>=0.14.9](https://www.terraform.io/downloads)

## Setup

This section requires very little setup, but it does have some optional variables that you can set in a vars file or from the command line:

```sh
profile="default" # which aws profile to use for authentication
region="us-east-1" # the region that the aws provider will use.

# The above values are the default values, if no other values are provided then the values above will be operative. 
```

## Running

You can run the terraform with the follwing script:

```sh
terraform init && terraform apply
```
