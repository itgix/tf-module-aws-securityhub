variable "enable_security_hub" {
  type        = bool
  default     = false
  description = "Enable or disable security hub"
}

variable "organization_management_account_id" {
  type        = string
  description = "The account ID of the organization managemnet account"
  default     = ""
}

variable "organization_member_account_ids" {
  type        = list(any)
  description = "List of member account IDs where guarduty will be enabled"
  default     = []
}

variable "aws_region" {
  type        = string
  description = "Some of the security standard subscriptions have different ARNs based on the region"
}

variable "enable_aws_security_best_practices_scanning" {
  type        = bool
  default     = false
  description = "Enable or disable scanning for compliance with - AWS Foundational Security Best Practices"
}

variable "enable_cis_aws_foundations_benchmark_v1_2_scanning" {
  type        = bool
  default     = false
  description = "Enable or disable scanning for compliance with - CIS AWS Foundations Benchmark v1.2.0"
}

variable "enable_cis_aws_foundations_benchmark_v1_4_scanning" {
  type        = bool
  default     = false
  description = "Enable or disable scanning for compliance with - CIS AWS Foundations Benchmark v1.4.0"
}

variable "enable_nist_sp_800_compliance_scanning" {
  type        = bool
  default     = false
  description = "Enable or disable scanning for compliance with - NIST SP 800-53 Rev. 5"
}

variable "enable_pci_dss_complaince_scanning" {
  type        = bool
  default     = false
  description = "Enable or disable scanning for compliance with - PCI DSS"
}
