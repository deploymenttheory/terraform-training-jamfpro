locals {
  prefix = "YOUR-INITIALS"
}

resource "jamfpro_smart_computer_group" "test_ring" {
  name = "${local.prefix}-Test Deployment Ring"

  criteria {
    name          = "Application Title"
    priority      = 0
    and_or        = "and"
    search_type   = "is"
    value         = "Test.app"
    opening_paren = false
    closing_paren = false
  }
}

resource "jamfpro_smart_computer_group" "test_ring" {
  name = "${local.prefix}-First Deployment Ring"

  criteria {
    name          = "Application Title"
    priority      = 0
    and_or        = "and"
    search_type   = "is"
    value         = "First.app"
    opening_paren = false
    closing_paren = false
  }
}

resource "jamfpro_smart_computer_group" "test_ring" {
  name = "${local.prefix}-Fast Deployment Ring"

  criteria {
    name          = "Application Title"
    priority      = 0
    and_or        = "and"
    search_type   = "is"
    value         = "Fast.app"
    opening_paren = false
    closing_paren = false
  }
}

resource "jamfpro_smart_computer_group" "test_ring" {
  name = "${local.prefix}-Broad Deployment Ring"

  criteria {
    name          = "Application Title"
    priority      = 0
    and_or        = "and"
    search_type   = "is"
    value         = "Broad.app"
    opening_paren = false
    closing_paren = false
  }
}
