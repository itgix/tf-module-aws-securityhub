The Terraform module is used by the ITGix AWS Landing Zone - https://itgix.com/itgix-landing-zone/

# AWS Security Hub Terraform Module

This module enables AWS Security Hub across an AWS Organization with delegated admin, member account associations, and configurable security standard subscriptions.

Part of the [ITGix AWS Landing Zone](https://itgix.com/itgix-landing-zone/).

## Resources Created

- Security Hub account configuration
- Security standard subscriptions
- Member account associations
- AWS Config recorder dependency

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `enable_security_hub` | Enable or disable Security Hub | `bool` | `false` | no |
| `securityhub_delegated_admin_account_id` | Account ID of the delegated admin for Security Hub | `string` | `""` | no |
| `organization_member_account_ids` | List of member account IDs | `list(any)` | `[]` | no |
| `aws_region` | AWS region (used for security standard ARNs) | `string` | — | yes |
| `enable_aws_security_best_practices_scanning` | Enable AWS Foundational Security Best Practices | `bool` | `false` | no |
| `enable_cis_aws_foundations_benchmark_v1_2_scanning` | Enable CIS AWS Foundations Benchmark v1.2.0 | `bool` | `false` | no |
| `enable_cis_aws_foundations_benchmark_v1_4_scanning` | Enable CIS AWS Foundations Benchmark v1.4.0 | `bool` | `false` | no |
| `enable_nist_sp_800_compliance_scanning` | Enable NIST SP 800-53 Rev. 5 | `bool` | `false` | no |
| `enable_pci_dss_v3_scanning` | Enable PCI DSS v3.2.1 | `bool` | `false` | no |
| `enable_pci_dss_v4_scanning` | Enable PCI DSS v4.0.1 | `bool` | `false` | no |
| `security_account_run` | Set to true if running from the Security Account | `bool` | `false` | no |
| `securityhub_notification_mail` | Email address for security notifications | `string` | `"aws-landing-zones@itgix.com"` | no |
| `invite_member_account` | Whether to invite accounts as members | `bool` | `false` | no |

## Usage Example

```hcl
module "securityhub" {
  source = "path/to/tf-module-aws-securityhub"

  enable_security_hub  = true
  security_account_run = true
  aws_region           = "eu-central-1"

  securityhub_delegated_admin_account_id = "111111111111"

  organization_member_account_ids = [
    "222222222222",
    "333333333333"
  ]

  enable_aws_security_best_practices_scanning      = true
  enable_cis_aws_foundations_benchmark_v1_4_scanning = true
}
```
