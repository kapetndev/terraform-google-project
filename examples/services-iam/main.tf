module "my_project" {
  source          = "git::https://github.com/kapetndev/terraform-google-project.git?ref=v0.1.0"
  billing_account = var.billing_account
  name            = "my-project"
  parent          = "organizations/${var.organization_id}"

  services = [
    "servicemanagement.googleapis.com",
    "sqladmin.googleapis.com",
  ]

  group_iam = {
    "mygroup@example.com" = [
      "roles/servicemanagement.admin",
      "roles/viewer",
    ]
  }

  iam = {
    "roles/cloudsql.client" = [
      "serviceAccount:${module.cloudsql_service_account.email}",
    ]
  }
}

module "cloudsql_service_account" {
  source       = "git::https://github.com/kapetndev/terraform-google-iam.git//modules/service_account?ref=v0.1.0"
  display_name = "CloudSQL"
  name         = "cloudsql-sa"
  project_id   = module.my_project.project_id
}
