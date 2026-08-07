variable "enable_security_hub" {
  type        = bool
  default     = false
  description = "Enable or disable security hub"
}

variable "securityhub_delegated_admin_account_id" {
  type        = string
  description = "The account ID of the organization delegated admin account for Security Hub"
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

variable "security_hub_standards_arns" {
  type        = list(string)
  default     = []
  description = "Security Hub standards ARNs to subscribe to; use '{region}' for region-specific ARNs (replaced with var.aws_region)."
}

variable "security_account_run" {
  type        = bool
  default     = false
  description = "Enable this if running terrafrom from the Security Account, should be false otherwise"
}

variable "securityhub_notification_mail" {
  type        = string
  default     = "aws-landing-zones@itgix.com"
  description = "(Optional) e-mail address that can be provided to receive updates about security issues"
}

variable "invite_member_account" {
  type        = bool
  default     = false
  description = "(Optional) Boolean whether to invite the account to Security Hub as a member. Defaults to false."
}
