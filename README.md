The Terraform module is used by the ITGix AWS Landing Zone - https://itgix.com/itgix-landing-zone/


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_securityhub_finding_aggregator.itgix_primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_finding_aggregator) | resource |
| [aws_securityhub_member.landing_zone_member_account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_member) | resource |
| [aws_securityhub_organization_configuration.itgix_primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_organization_configuration) | resource |
| [aws_securityhub_standards_subscription.aws_security_best_practices](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_standards_subscription) | resource |
| [aws_securityhub_standards_subscription.cis_aws_foundations_security_benchmark_1_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_standards_subscription) | resource |
| [aws_securityhub_standards_subscription.cis_aws_foundations_security_benchmark_1_4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_standards_subscription) | resource |
| [aws_securityhub_standards_subscription.nist_sp_800_53_rev_5](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_standards_subscription) | resource |
| [aws_securityhub_standards_subscription.pci_dss_compliance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_standards_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Some of the security standard subscriptions have different ARNs based on the region | `string` | `"eu-central-1"` | no |
| <a name="input_enable_aws_security_best_practices_scanning"></a> [enable\_aws\_security\_best\_practices\_scanning](#input\_enable\_aws\_security\_best\_practices\_scanning) | Enable or disable scanning for compliance with - AWS Foundational Security Best Practices | `bool` | `false` | no |
| <a name="input_enable_cis_aws_foundations_benchmark_v1_2_scanning"></a> [enable\_cis\_aws\_foundations\_benchmark\_v1\_2\_scanning](#input\_enable\_cis\_aws\_foundations\_benchmark\_v1\_2\_scanning) | Enable or disable scanning for compliance with - CIS AWS Foundations Benchmark v1.2.0 | `bool` | `false` | no |
| <a name="input_enable_cis_aws_foundations_benchmark_v1_4_scanning"></a> [enable\_cis\_aws\_foundations\_benchmark\_v1\_4\_scanning](#input\_enable\_cis\_aws\_foundations\_benchmark\_v1\_4\_scanning) | Enable or disable scanning for compliance with - CIS AWS Foundations Benchmark v1.4.0 | `bool` | `false` | no |
| <a name="input_enable_nist_sp_800_compliance_scanning"></a> [enable\_nist\_sp\_800\_compliance\_scanning](#input\_enable\_nist\_sp\_800\_compliance\_scanning) | Enable or disable scanning for compliance with - NIST SP 800-53 Rev. 5 | `bool` | `false` | no |
| <a name="input_enable_pci_dss_complaince_scanning"></a> [enable\_pci\_dss\_complaince\_scanning](#input\_enable\_pci\_dss\_complaince\_scanning) | Enable or disable scanning for compliance with - PCI DSS | `bool` | `false` | no |
| <a name="input_enable_security_hub"></a> [enable\_security\_hub](#input\_enable\_security\_hub) | Enable or disable security hub | `bool` | `false` | no |
| <a name="input_invite_member_account"></a> [invite\_member\_account](#input\_invite\_member\_account) | (Optional) Boolean whether to invite the account to Security Hub as a member. Defaults to false. | `bool` | `false` | no |
| <a name="input_organization_member_account_ids"></a> [organization\_member\_account\_ids](#input\_organization\_member\_account\_ids) | List of member account IDs where guarduty will be enabled | `list(any)` | `[]` | no |
| <a name="input_security_account_run"></a> [security\_account\_run](#input\_security\_account\_run) | Enable this if running terrafrom from the Security Account, should be false otherwise | `bool` | `false` | no |
| <a name="input_securityhub_delegated_admin_account_id"></a> [securityhub\_delegated\_admin\_account\_id](#input\_securityhub\_delegated\_admin\_account\_id) | The account ID of the organization delegated admin account for Security Hub | `string` | `""` | no |
| <a name="input_securityhub_notification_mail"></a> [securityhub\_notification\_mail](#input\_securityhub\_notification\_mail) | (Optional) e-mail address that can be provided to receive updates about security issues | `string` | `"aws-landing-zones@itgix.com"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
