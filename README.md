# terraform-google-project ![policy](https://github.com/kapetndev/terraform-google-project/workflows/policy/badge.svg?event=push)

Terraform module to create and manage a Google Cloud Platform project.

## Usage

See the [examples](examples) directory for working examples for reference:

```hcl
module "my_project" {
  source = "git::https://github.com/kapetndev/terraform-google-project.git?ref=v0.1.0"
  name   = "my-project"
}
```

## Requirements

| Name | Version |
|------|---------|
| [terraform](https://www.terraform.io/) | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| [google](https://registry.terraform.io/providers/hashicorp/google/latest) | >= 4.71.0 |
| [random](https://registry.terraform.io/providers/hashicorp/random/latest) | >= 3.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [`random_id.project_id`](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [`google_project.project`](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project) | resource |
| [`google_project_service.services[*]`](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service) | resource |
| [`google_project_iam_binding.authoritative[*]`](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam) | resource |
| [`google_project_iam_member.non_authoritative[*]`](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam) | resource |
| [`google_tags_tag_binding.binding[*]`](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/tags_tag_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `name` | The project name. An ID suffix will be added to the name to ensure uniqueness | `string` | | yes |
| `auto_create_network` | Whether to create the default network for the project | `bool` | `false` | no |
| `billing_account` | The alphanumeric billing account ID | `string` | `null` | no |
| `descriptive_name` | The name of the project. Used for project name instead of `name` variable | `string` | `null` | no |
| `disable_dependent_services` | Whether to disable dependent services when disabling a service | `bool` | `false` | no |
| `disable_on_destroy` | Whether to disable the service when the resource is destroyed | `bool` | `true` | no |
| `group_iam` | Authoritative IAM binding for organization groups, in `{GROUP_EMAIL => [ROLES]}` format. Group emails must be static. Can be used in combination with the `iam` variable | `map(set(string))` | `{}` | no |
| `iam` | Authoritative IAM bindings in `{ROLE => [MEMBERS]}` format | `map(set(string))` | `{}` | no |
| `iam_member` | Non-authoritative IAM bindings in `{ROLE = [MEMBERS]}` format. Can be used in combination with the `iam` variable. Typically this will be used for default service accounts or other Google managed resources | `map(set(string))` | `{}` | no |
| `parent` | The parent folder or organization in 'folders/folder\_id' or 'organizations/org\_id' format | `string` | `null` | no |
| `prefix` | An optional prefix used to generate project id | `string` | `null` | no |
| `project_id` | The ID of the project. If it is not provided the name of the project is used followed by a random suffix | `string` | null | no |
| `services` | A list of services to enable in the project | `set(string)` | `[]` | no |
| `tag_bindings` | Tag bindings for this project, in `{key => tag}` value id format | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| `project_id` | The project ID |
| `project_number` | The numeric identifier of the project |
