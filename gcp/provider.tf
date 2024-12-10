terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.9.0"
    }
    stackguardian = {
      source  = "stackguardian/stackguardian"
      version = "1.1.0-rc5"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "google" {
  project = var.gcp_organization_id
}

provider "stackguardian" {
  org_name = var.sg_org_name
  api_key  = var.sg_api_key
}
