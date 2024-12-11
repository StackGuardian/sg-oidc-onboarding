# GCP Example to onboard cloud projects onto StackGuardian using OIDC

## Pre-Requisite
The service account used for this operation needs to be owner in a Project of the Organisation. Further the service account will need following permissions on the organizational level: 

- `roles/iam.serviceAccountAdmin`: This role grants full management of service accounts, including the ability to create, delete, and modify service accounts.
- `roles/iam.workloadIdentityPoolAdmin`: This role allows the service account to create and manage IAM Workload Identity Pools and IAM Workload Identity Pool Providers.
- `roles/resourcemanager.projectIamAdmin`: This role grants permissions to administer allow policies on projects.

## User Guide

- Move to the appropriate cloud provider folder
- Configure the latest version of stackguardian provider in provider.tf
- Create `terraform.tfvars` file and populate the variables from variables.tf
- Run `terraform init`
- Run `terraform plan` and `terraform apply`
