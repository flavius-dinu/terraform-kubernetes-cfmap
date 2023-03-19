# Terraform Kubernetes ConfigMap

## Workflows
In this module there are 3 github actions workflows:
- **auto_tag.yaml**
    - this workflow will run whenever a merge to the main branch occurs
    - it will by default tag your repository with a Patch bump (version format is: vMajor.Minor.Patch)
    - if you want to bump the major or the minor version of the repository, you will simply have to start your commit with #major or #minor
- **pre_commit.yaml**
    - this workflow will run on every push in order to check: tflint, tf-docs, validate, fmt, end-of-file fixer and trailing whitspace fixes and whatever else you decide to add to the .pre-commit-config.yaml file
- **terraform.yaml**
    - this workflow can be run manually based on an operation you provide (plan, apply, destroy)
    - it is recommended to use remote state in order to take advantage of this

## Installing pre-commit locally
In order to make sure that you are writing code that respects industry standards, you will need to install:
- [pre-commit](https://pre-commit.com)
- [tf-docs](https://github.com/terraform-docs/terraform-docs)
- [tflint](https://github.com/terraform-linters/tflint)

After you install all of these, you can go to the root directory of the repository and run:

`pre-commit run --all-files`

This will fix all the problems related to the hooks mentioned above.

## Taking advantage of Terraform-Docs

You will need to add the following in **README.md** in order to auto-populate the documentation with terraform-docs.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > 1.3.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.18.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.18.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_config_map.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) | resource |
| [kubernetes_namespace.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_maps"></a> [config\_maps](#input\_config\_maps) | Config map parameters | <pre>map(object({<br>    namespace              = string<br>    labels                 = optional(map(string), {})<br>    annotations            = optional(map(string), {})<br>    use_existing_namespace = optional(bool, false)<br>    data                   = optional(map(string), {})<br>    binary_data            = optional(map(string), {})<br>  }))</pre> | `{}` | no |
| <a name="input_namespaces"></a> [namespaces](#input\_namespaces) | Namespaces parameters | <pre>map(object({<br>    labels      = optional(map(string), {})<br>    annotations = optional(map(string), {})<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_config_maps"></a> [config\_maps](#output\_config\_maps) | Config map outputs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
