# Examples to onboard cloud projects onto StackGuardian using OIDC

## Pre-Requisite
User have to make sure that they run the terraform script against the organization and not any specific project.
The service account should be assigned the roles/iam.serviceAccountAdmin role, which grants full management of service accounts, including the ability to create, delete, and modify service accounts. This service account should be created at the organization level, not within any specific project.
Additionally, the service account should have the following roles assigned:
- `roles/iam.workloadIdentityPoolAdmin`: This role allows the service account to create and manage IAM Workload Identity Pools and IAM Workload Identity Pool Providers.
- `roles/iam.workloadIdentityUser`: This role enables the service account to use a Workload Identity Pool to assume identities.

## User Guide

- Move to the appropriate cloud provider folder
- Configure the latest version of stackguardian provider in provider.tf
- Run `terraform init`
- Create `terraform.tfvars` file and populate the variables from variables.tf
- Run `terraform plan` and `terraform apply`
