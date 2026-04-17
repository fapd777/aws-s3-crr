<!-- BEGIN_TF_DOCS -->

# aws-s3-cross-region-replication

This repository is meant to hold all of the relevant stateful Terraform code
for an AWS S3 bucket with Cross Region Replication .

**AWS account ID:** 381511845811

## Deployment

To quickly initialize the current Terraform configuration and create or update
the associated infrastructure, try the following commands:

> **_NOTE:_**  You must have a valid AWS session token for the following
commands to complete successfully.

### Development (dev)

Prepare your working directory for other Terraform commands:
```bash
terraform init -backend-config=./init-tfvars/dev.tfvars
```
Show changes required by the current configuration:
```bash
terraform plan -var-file ./apply-tfvars/dev.tfvars
```
Create or update infrastructure:
```bash
terraform apply -var-file ./apply-tfvars/dev.tfvars
```
 
## Documentation

This repo is self documenting via Terraform Docs, please see the note at the
bottom.

The `.config/.terraform-docs.yml` file auto generates the `README.md` file

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.destination](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.source](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.destination](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_lifecycle_configuration.source](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_public_access_block.destination](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.source](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_versioning.destination](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_versioning.source](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | Environment name string to be used for decisions and name generation | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | String to use as prefix on object names | `string` | n/a | yes |
| <a name="input_org"></a> [org](#input\_org) | Organization name | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region to target | `string` | n/a | yes |
| <a name="input_source_repo"></a> [source\_repo](#input\_source\_repo) | name of repo which holds this code | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | Account which terraform was run on |
| <a name="output_common_tags"></a> [common\_tags](#output\_common\_tags) | tags which should be applied to all taggable objects |
| <a name="output_env_name"></a> [env\_name](#output\_env\_name) | string to append to all resource names |
| <a name="output_name_prefix"></a> [name\_prefix](#output\_name\_prefix) | string to prepend to all resource names |
| <a name="output_org"></a> [org](#output\_org) | string to prepend to resource name - optional |
| <a name="output_region"></a> [region](#output\_region) | region being used |

---

> **_NOTE:_**  Manual changes to the README will be overwritten when the
documentation is updated. To update the documentation, run:
```bash
terraform-docs --config .config/.terraform-docs.yml .
```

## Pre-commit

Project maintainers can take advantage of `pre-commit` to automate various
tasks before commiting changes to repositories. To easily recreate the checks
that GitHub Actions performs when a pull request is created or updated,
you can create the following alias from your shell:

```bash
alias pre-commit-run=\
'docker run --rm \
-v "$(pwd):/lint" \
-w /lint \
--entrypoint /bin/sh \
ghcr.io/antonbabenko/pre-commit-terraform:latest \
-c "tflint --init && pre-commit run -a"'
```
```bash
pre-commit-run
```
<!-- END_TF_DOCS -->