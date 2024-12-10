variable "gcp_organization_id" {
  description = "GCP organization id"
  type        = string
}

variable "sg_api_key" {
  description = "StackGuardian organization API key"
  type        = string
  sensitive   = true
}

variable "sg_org_name" {
  description = "StackGuardian organization name"
  type        = string
}
