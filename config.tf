resource "aws_securityhub_finding_aggregator" "itgix_primary" {
  count        = var.enable_security_hub && var.security_account_run ? 1 : 0
  linking_mode = "ALL_REGIONS"
}

# Auto enable security hub in organization member accounts
resource "aws_securityhub_organization_configuration" "itgix_primary" {
  count       = var.enable_security_hub && var.security_account_run ? 1 : 0
  auto_enable = true
}
