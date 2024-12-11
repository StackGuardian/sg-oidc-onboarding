# Examples to onboard cloud projects onto StackGuardian using OIDC

## Pre-Requisite
User have to make sure that they run the terraform script against the organization id and not any specific project. The service account will need permissions to perform actions at the organization level.
The service account should also should have the following roles assigned: 
- `roles/resourcemanager.organizationAdmin` role allows the service account to manage resources at the organization level, including managing projects, setting IAM policies, and more.
- `roles/iam.serviceAccountAdmin`: This role grants full management of service accounts, including the ability to create, delete, and modify service accounts.
- `roles/iam.workloadIdentityPoolAdmin`: This role allows the service account to create and manage IAM Workload Identity Pools and IAM Workload Identity Pool Providers.
- `roles/iam.workloadIdentityUser`: This role enables the service account to use a Workload Identity Pool to assume identities.

## User Guide

This Repository provides examples to onboard whole organisations to StackGuardian. 

First, the respective permissions and resources will be created in the Cloud Providers - Service Accounts(GCP), Roles (AWS), SPN(Azure). 
Second, the permissions are tied to StackGuardian Cloud Connectors, that will allow StackGuardian to perform actions within the Cloud Project/Account/Subscription.

For these purpose, follow the README.md within the respective cloud provider.
