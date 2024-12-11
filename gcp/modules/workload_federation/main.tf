# random string for pool id
resource "random_string" "identity-pool-id" {
  length  = 8
  special = false
  upper   = false
}
resource "random_string" "identity-pool-provider-id" {
  length  = 8
  special = false
  upper   = false
}

# Create Service Account
resource "google_service_account" "sg-test-service-account" {
  account_id   = "sg-test-service-account"
  display_name = "StackGuardian Service Account"
  project      = var.gcp_project_id
}

resource "google_iam_workload_identity_pool" "sg-pool" {
  workload_identity_pool_id = "stackguardian-${random_string.identity-pool-id.result}"
  project                   = var.gcp_project_id
}

resource "google_iam_workload_identity_pool_provider" "sg-oidc-connector-provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.sg-pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "stackguardian-${random_string.identity-pool-provider-id.result}"
  project                            = var.gcp_project_id
  display_name                       = "SG OIDC provider"
  description                        = "OIDC identity pool provider for StackGuardian Connector"
  disabled                           = false
  attribute_mapping = {
    "google.subject" = "assertion.sub"
  }
  oidc {
    allowed_audiences = ["https://testapi.qa.stackguardian.io"]
    issuer_uri        = "https://testapi.qa.stackguardian.io"
  }
  depends_on = [google_iam_workload_identity_pool.sg-pool]
}


# Allow Service Account Impersonation via Federation
resource "google_service_account_iam_member" "allow_federation_impersonation" {
  service_account_id = google_service_account.sg-test-service-account.id
  role               = "roles/iam.workloadIdentityUser"
  member             = google_service_account.sg-test-service-account.member
  depends_on         = [google_iam_workload_identity_pool.sg-pool, google_service_account.sg-test-service-account]
}


# Assign Policy for Federated Identity
resource "google_service_account_iam_policy" "federated_identity" {
  service_account_id = google_service_account.sg-test-service-account.name

  policy_data = <<EOF
    {
      "bindings" : [
        {
          "role" : "roles/iam.workloadIdentityUser",
          "members" : [
            "principal://iam.googleapis.com/${google_iam_workload_identity_pool.sg-pool.name}/subject//orgs/${var.sg_org}",
            "${google_service_account.sg-test-service-account.member}"
          ]
        }
      ]
  }
  EOF
  depends_on  = [google_service_account.sg-test-service-account, google_iam_workload_identity_pool.sg-pool]
}

# Grant the Service Account the necessary permissions
resource "google_project_iam_member" "sg-test-service-account-iam" {
  project    = var.gcp_project_id
  role       = "roles/owner"
  member     = google_service_account.sg-test-service-account.member
  depends_on = [google_service_account.sg-test-service-account]
}
# Download the Client Library Configuration File, use token path /mnt/sg_workspace/user/stackguardian.oidc

resource "stackguardian_connector" "oidc-gcp" {
  resource_name = "${var.gcp_project_id}-test-oidc-connector"
  settings = {
    kind = "GCP_OIDC"
    config = [{
      gcp_config_file_content = templatefile("${path.module}/gcp_oidc_config.tftpl", {
        project-id                    = var.gcp_project_id
        project-number                = var.gcp_project_number
        service-account-email         = google_service_account.sg-test-service-account.email
        sg-pool-id                    = google_iam_workload_identity_pool.sg-pool.name
        sg-oidc-connector-provider-id = google_iam_workload_identity_pool_provider.sg-oidc-connector-provider.workload_identity_pool_provider_id
      })
    }]
  }
}
