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
| `security_hub_standards_arns` | List of Security Hub standards ARNs to subscribe to. Use the literal placeholder `{region}` where the ARN needs the current region substituted in. See [AWS standards reference](https://docs.aws.amazon.com/securityhub/latest/userguide/standards-reference.html) for the full list. Enabling a newly released standard only requires adding its ARN to this list, no module changes needed. | `list(string)` | `[]` | no |
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

  security_hub_standards_arns = [
    "arn:aws:securityhub:{region}::standards/aws-foundational-security-best-practices/v/1.0.0",
    "arn:aws:securityhub:{region}::standards/cis-aws-foundations-benchmark/v/1.4.0",
  ]
}
```
