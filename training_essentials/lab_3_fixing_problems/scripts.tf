locals {
  prefix = "YOUR-INITIALS"
}

resource "jamfpro_script" "testing_script" {
  name            = "${local.prefix}-testing-script"
  script_contents = file("${path.module}/scripts/newScript.sh")
  priority        = BEFORE
}
