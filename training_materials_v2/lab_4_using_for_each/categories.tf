locals {
  jamf_categories = {
    "Security"               = 1
    "Compliance"             = 2
    "Endpoint Protection"    = 3
    "Operating System"       = 4
    "Patch Management"       = 5
    "Updates"                = 6
    "Certificates"           = 7
    "Configuration Profiles" = 8
    "Device Management"      = 9
    "Enrollment"             = 10
    "Maintenance"            = 11
    "System Utilities"       = 12
    "Networking"             = 13
    "VPN & Remote Access"    = 14
    "Printers"               = 15
    "Applications"           = 16
    "Browsers"               = 17
    "Productivity"           = 18
    "Communication"          = 19
    "Education Tools"        = 20
    "Developer Tools"        = 21
    "IT Administration"      = 22
    "Inventory Management"   = 23
    "Scripts"                = 24
    "Testing & QA"           = 25
  }

  prefix = "YOUR-INITIALS"
}
