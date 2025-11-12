locals {
  prefix = "YOUR-INITIALS"
}

resource "jamfpro_macos_configuration_profile_plist" "jamfpro_macos_configuration_profile_064" {
  name                = "${local.prefix}-wifi-profile"
  description         = "A WiFi profile for test network"
  level               = "System"
  distribution_method = "Install Automatically"
  redeploy_on_update  = "Newly Assigned"
  payloads            = file("${path.module}/configs/file.mobileconfig")
  payload_validate    = true
  user_removable      = false

  scope {
    all_computers = true
    all_jss_users = false
  }

}
