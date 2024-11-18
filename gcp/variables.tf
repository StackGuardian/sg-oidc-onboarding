variable "gcp_organization_id" {
  type = string
}

variable "api_key" {
  type      = string
  sensitive = true
}

variable "api_uri" {
  type = string
}

variable "sg_org_name" {
  type = string
}

variable "workload_identity_pool_id" {
  type = string
}
