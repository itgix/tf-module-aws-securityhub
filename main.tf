# Enable SecurityHub in delegated admin account - acc where SecurityHub will be managed for the whole organization
resource "aws_securityhub_account" "itgix_primary" {
  count = var.enable_security_hub && var.management_account_run ? 1 : 0
}

# Designate a security hub admin account
resource "aws_securityhub_organization_admin_account" "itgix_primary" {
  count            = var.enable_security_hub && var.management_account_run ? 1 : 0
  admin_account_id = var.organization_delegated_admin_account_id

  depends_on = [aws_securityhub_account.itgix_primary]
}

resource "aws_securityhub_finding_aggregator" "itgix_primary" {
  count        = var.enable_security_hub && var.security_account_run ? 1 : 0
  linking_mode = "ALL_REGIONS"
}

# Auto enable security hub in organization member accounts
resource "aws_securityhub_organization_configuration" "itgix_primary" {
  count       = var.enable_security_hub && var.security_account_run ? 1 : 0
  auto_enable = true
}

# Enable AWS Foundational Security Best Practices
resource "aws_securityhub_standards_subscription" "aws_security_best_practices" {
  count         = var.enable_security_hub && var.security_account_run && var.enable_aws_security_best_practices_scanning ? 1 : 0
  standards_arn = "arn:aws:securityhub:${var.aws_region}::standards/aws-foundational-security-best-practices/v/1.0.0"
}

# Enable CIS foundations benchmark v1.2
resource "aws_securityhub_standards_subscription" "cis_aws_foundations_security_benchmark_1_2" {
  count         = var.enable_security_hub && var.security_account_run && var.enable_cis_aws_foundations_benchmark_v1_2_scanning ? 1 : 0
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
}

# Enable CIS foundations benchmark v1.4
resource "aws_securityhub_standards_subscription" "cis_aws_foundations_security_benchmark_1_4" {
  count         = var.enable_security_hub && var.security_account_run && var.enable_cis_aws_foundations_benchmark_v1_4_scanning ? 1 : 0
  standards_arn = "arn:aws:securityhub:${var.aws_region}::standards/cis-aws-foundations-benchmark/v/1.4.0"
}

# Enable PCI DSS compliance scanning
resource "aws_securityhub_standards_subscription" "pci_dss_compliance" {
  count         = var.enable_security_hub && var.security_account_run && var.enable_pci_dss_complaince_scanning ? 1 : 0
  standards_arn = "arn:aws:securityhub:${var.aws_region}::standards/pci-dss/v/3.2.1"
}

# Enable NIST SP 800-53 Rev. 5 compliance scanning - https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final
resource "aws_securityhub_standards_subscription" "nist_sp_800_53_rev_5" {
  count         = var.enable_security_hub && var.security_account_run && var.enable_nist_sp_800_compliance_scanning ? 1 : 0
  standards_arn = "arn:aws:securityhub:${var.aws_region}::standards/nist-800-53/v/5.0.0"
}

# Member accounts
resource "aws_securityhub_member" "landing_zone_member_account" {
  count      = var.enable_security_hub && var.security_account_run ? length(var.organization_member_account_ids) : 0
  account_id = var.organization_member_account_ids[count.index]
  email      = var.security_email # this is optional
  invite     = false              # this is optional
}
