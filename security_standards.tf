# Subscribe to Security Hub standards from a caller-supplied list of ARNs (see var.security_hub_standards_arns).
# To enable a newly released AWS standard, add its ARN to that list in the calling stack's tfvars -
# no changes to this module are required. Use the literal placeholder "{region}" where the ARN needs the
# current AWS region substituted in.
resource "aws_securityhub_standards_subscription" "this" {
  for_each      = var.enable_security_hub && var.security_account_run ? toset(var.security_hub_standards_arns) : toset([])
  standards_arn = replace(each.value, "{region}", var.aws_region)
}

