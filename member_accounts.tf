# Member accounts
resource "aws_securityhub_member" "landing_zone_member_account" {
  count      = var.enable_security_hub && var.security_account_run ? length(var.organization_member_account_ids) : 0
  account_id = var.organization_member_account_ids[count.index]
  email      = var.securityhub_notification_mail # this is optional
  invite     = var.invite_member_account         # this is optional

  # Terraform keeps trying to recrease the resources due to invite or email changes that happen automatically in AWS, even when they are not configured at all
  # so we set them once and ignore changes to them after
  lifecycle {
    ignore_changes = [
      email,
      invite
    ]
  }
}
