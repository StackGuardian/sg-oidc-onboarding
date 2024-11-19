variable "gcp_organization_id" {
  description = "GCP organization id"
  type        = string
}

variable "api_key" {
  description = "StackGuardian organization API key"
  type        = string
  sensitive   = true
}

variable "sg_org_name" {
  description = "StackGuardian organization name"
  type        = string
}

variable "workload_identity_pool_id" {
  description = "GCP identity pool name"
  type        = string
}
