#StackGuardian OIDC Connector
data "google_projects" "my-projects" {
  filter = "parent.type:organization AND parent.id:${var.gcp_organization_id}"
}

module "workload_federation" {
  source = "./modules/workload_federation"

  for_each = {
    for index, project in data.google_projects.my-projects.projects :
    index => project
  }

  sg_org             = var.sg_org_name
  gcp_project_id     = each.value.project_id
  gcp_project_number = each.value.number
}
