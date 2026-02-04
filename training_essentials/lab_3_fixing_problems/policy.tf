locals {
  prefix = "YOUR-INITIALS"
}

resource "jamfpro_policy" "jamfpro_lab_02" {
  name                        = "${local.prefix}-tf-training-lab-02"
  enabled                     = false
  trigger_checkin             = false
  frequency                   = "Once"
  retry_event                 = "none"
  notify_on_each_failed_retry = false
  target_drive                = "/"
  offline                     = false

  scope {
    all_computers = false
    all_jss_users = false

    computer_ids = [jamfpro_smart_computer_group.test_ring]
  }

  payloads {

    maintenance {
      recon = true
    }

    files_processes {
      run_command = "echo 'Hello, World!'"
    }
  }
}
