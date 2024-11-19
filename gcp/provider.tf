terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.9.0"
    }
    stackguardian = {
      source  = "stackguardian/stackguardian"
      version = "1.1.0-rc2"
    }
  }
}

provider "google" {
  project = var.gcp_organization_id
}

provider "stackguardian" {
  org_name = var.sg_org_name
  api_key  = var.api_key
}
