terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.9.0"
    }
    stackguardian = {
      source  = "stackguardian/stackguardian"
      version = "1.1.0-rc4"
    }
  }
}
