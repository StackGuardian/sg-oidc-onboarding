# Examples to onboard cloud projects onto StackGuardian using OIDC

## Pre-Requisite
User have to make sure that they run the terraform script against the organization id and not any specific project. The service account will need permissions to perform actions at the organization level, `roles/resourcemanager.organizationAdmin` role allows the service account to manage resources at the organization level, including managing projects, setting IAM policies, and more.
The service account should also should have the following roles assigned: 
- `roles/iam.serviceAccountAdmin`: This role grants full management of service accounts, including the ability to create, delete, and modify service accounts.
- `roles/iam.workloadIdentityPoolAdmin`: This role allows the service account to create and manage IAM Workload Identity Pools and IAM Workload Identity Pool Providers.
- `roles/iam.workloadIdentityUser`: This role enables the service account to use a Workload Identity Pool to assume identities.

## User Guide

- Move to the appropriate cloud provider folder
- Configure the latest version of stackguardian provider in provider.tf
- Run `terraform init`
- Create `terraform.tfvars` file and populate the variables from variables.tf
- Run `terraform plan` and `terraform apply`
