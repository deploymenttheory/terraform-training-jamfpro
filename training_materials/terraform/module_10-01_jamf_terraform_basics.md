# Module 5-01 - Jamf Pro Configuration

## _Duration: 1 hour | Labs: 3_ | Difficulty: 🟢 Beginner\*

## 🎯 Learning Objectives

By the end of this module, you will be able to:

- ✅ Configure infrastructure resources in Jamf Pro such as Sites, Network Segments, Self Service and Developing a basic Script/Policy
- ✅ Configure API Roles & Clients for API Usage
- ✅ Configure Enrolment Settings such as LAPS and User-initiated Enrolment

### 📚 Topics Covered

This guide presumes that you have completed the previous exercises on Terraform and HashiCorp Language, you understand the structure of a Terraform resource and already have the Terraform provider installed and integrated to a Jamf Pro tenant from the lab setup module.

How you set up your environment and utilise the Terraform provider will not be covered in this module, but should have been covered in a previous module. This guide will focus on learning how to use the Jamf Pro Terraform Provider by giving examples and exercises to build your knowledge on the specific Jamf Pro resources.

In this module, you will complete the following exercises:

1. [Exercise 1 - Infrastructure](#exercise-1---infrastructure)
2. [Exercise 2 - API Roles & Clients](#exercise-2---api-roles--clients)
3. [Exercise 3 - Enrolment](#exercise-3---enrolment)

## Exercise 1 - Infrastructure

In this exercise we are going to discuss basic configurations of a Jamf Pro server. The Jamf Pro Terraform Provider can configure all parts of the Jamf Pro tenant, in this section we are going to cover the following objects:

- [Sites](#sites)
- [Network Segments](#network-segments)
- [Configuring Self Service](#configuring-self-service)
- [Deploying a Health Check Policy](#deploying-a-health-check-policy)

For more information on any of the resources we are going to create today, you can see the full breakdown from the schema on the [Terraform Registry](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources) webpage.

### Sites

Sites are an easy resource to configure as all it requires is a name of the site. Sites can also then be used in reference later in other Terraform resources.

A site can be created in Terraform using the following resource:

```hcl
resource "jamfpro_site" "jamf_pro_site_leeds" {
    name = "gd-training-leeds"
}
```

This resource will create a 'jamfpro_site' resource with the unique identifier 'jamf_pro_site_1'. As a site in Jamf only requires one attribute, a name. The only attribute we are required to enter here is the name, which in this case is 'gd-training-london'.

Once you apply this run, the site will be created in the linked Jamf Pro tenant.

You can see more about Sites on this [Terraform Registry](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/site) webpage.

#### Sites - Exercise 1.1 - Creating a Site

In this exercise, you will create the above site within your terraform project and push the change to your Jamf Pro instance.

Follow these steps:

1. Create a new file in your Terraform project in the working directory and name it `sites.tf`
2. Add in the site resource mentioned above and create a site. You can change the name attribute to anything you would like. **(Ensure that the identifier is unique for every site that you create)**
3. Save the file
4. Create the site by running the `terraform plan` & `terraform apply` commands in the terminal in the working directory

#### Sites - Exercise 1.2 - Creating more Sites

In this exercise, you are going to create more sites without instruction. It is worth noting here, you do not need to create a file for each site, you can create multiple resources in one terraform file. Following the steps above (excluding the file creation) and the resources provided, create 4 more sites as follows:

1. Create a site for Manchester
2. Create a site for Glasgow
3. Create a site for California
4. Create a site for Texas
5. Now that you have created all of your sites, verify that the sites have been created in your Jamf Pro instance.

### Network Segments

The next resource that we are going to look at is Network Segments. Network Segment resources require a lot more configuration than the Sites. An example of a Network Segment is the following:

```hcl
resource "jamfpro_network_segment" "jamfpro_network_segment_example" {
  name                 = "Example Network Segment"
  starting_address     = "10.16.123.0"
  ending_address       = "10.16.123.254"
  distribution_server  = "Example Distribution Server"
  distribution_point   = "Example Distribution Point"
  url                  = "http://example.com"
  swu_server           = "Example SWU Server"
  building             = "Main Building"
  department           = "IT Department"
  override_buildings   = false
  override_departments = false
}
```

This resource will create a 'jamfpro_network_segment' with the unique identifier 'jamfpro_network_segment_example'. The network segment has multiple attributes that require configuring. You can see more details on the full requirements on the registry page below. The main requirements are name, starting address and ending address.

You can see more about network segments on this [Terraform Registry](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/network_segment) webpage.

#### Network Segments - Exercise 1.3 - Creating a Network Segment

In this exercise, you will create a network segment and push the change to your Jamf Pro server.

Follow these steps to create the network segment:

1. Create a new file in your project in your working directory and name it `network_segments.tf`
2. Add in the network segment resource mentioned above and create a network segment. You can fill in the attributes with any IP range and give it a name. Following the schema, the only required fields are name, starting address and ending address, only use these fields
3. Save the file
4. Run your terraform and create the network segment by running the `terraform plan` & `terraform apply` command in the terminal in the working directory
5. Verify that the network segment has been created in your Jamf Pro tenant

### Configuring Self Service

Configuring the Self Service Application is a setting that can only be configured one time. It cannot have multiple configurations. So when configuring this resource, you need to ensure that it is not configured elsewhere. It can be customised using the following resource:

```hcl
resource "jamfpro_self_service_settings" "example" {
  install_automatically    = true
  install_location         = "/Applications"
  user_login_level         = "Anonymous"
  allow_remember_me        = true
  use_fido2                = false
  auth_type                = "Basic"
  notifications_enabled    = true
  alert_user_approved_mdm  = true
  default_landing_page     = "HOME"
  default_home_category_id = -1
  bookmarks_name           = "Bookmarks"
}
```

This resource will create a 'jamfpro_self_service_settings' with the unique identifier 'example'. The Self Service Configuration has multiple attributes that are required. You can see more details on the full requirements on the registry page below. All the attributes written above are required, but there are additional optional attributes which can be found in the Terraform Registry link below.

You can see more about network segments on this [Terraform Registry](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/self_service_settings) webpage.

#### Configuring Self Service - Exercise 1.4 - Customising Self Service

In this exercise, you will customise the Self Service application to your liking for your organisation.

**Before configuring the Self Service Settings - If you are completing this training in a team, ensure that no-one else is running their `terraform apply` at the same time, as this could cause a conflict**

Follow the steps below to customise the Self Service Application:

1. Create a new file in your project in the working directory and name it `self_service_customisation.tf`
2. Add in the Self Service Configuration resource mentioned above and customise the Self Service application to meet the requirements of your organisation. Following the schema, you can adapt the customisation as you see fit
3. Save the file
4. Run your terraform and customise self-service by running the `terraform plan` & `terraform apply` command in the terminal in the working directory
5. Verify that the configuration has taken effect
6. **(Optional) If working in a team -** Tidy up your configuration by running the `terraform destroy` command. This will destroy all of your resources that you have created and allow others to run their `terraform apply`

### Deploying a Health Check Policy

Deploying a Health Check in Jamf can be useful to determine if the tenant is online. This section will describe the process of creating a script and a policy resource that will be deployed to check the status of the Jamf Pro tenant.

#### Creating and uploading the script

The following script is what will be used to check the if the Jamf Pro tenant is online **change the URL in the `curl` command to match your Jamf Pro tenant**:

```bash
#!/bin/bash

result=$(curl https://JAMF_PRO_URL.jamfcloud.com/healthCheck.html)

if [[ $result == "[]" ]]; then
    echo 'Jamf Tenant is online'
else
    echo 'Jamf Tenant is offline'
fi
```

The next step would be to create a script resource in terraform to upload the script into Jamf Pro. This can be done in 2 methods, either by creating the resource with an inline script, or by uploading the script from a file. For multi-line scripts like these, it is easier to manage by using an external file. The following resource block will show how to upload the script via a file.

```hcl
// Script example an uploaded script taken from a file path with parameters
resource "jamfpro_script" "scripts_0001" {
  name            = "tf-jamf-health-check"
  script_contents = file("support_files/scripts/Add.sh")
  category_id     = 5      s
  priority        = "BEFORE"
  info            = "Adds target user or group to specified group membership, or removes said membership."
  notes           = "Jamf Pro script parameters 4 -> 7"
}
```

This resource will create a Script object in Jamf Pro with the name `tf-jamf-health-check`, with the contents of the file being uploaded from `support_files/scripts/Add.sh`, the Priority of `Before` and some other attributes that can be abstracted from the resource above. The required fields in this resource are the name, script contents and priority. For more information on other attributes and optional attributes you can see the Terraform Registry link below.

You can see more about scripts on this [Terraform Registry](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/script) webpage.

#### Creating and deploying the Policy

Now that the script file is created and uploaded to Jamf, a policy can be created to deploy a policy to device via Self Service.

To create a Policy resource in Terraform, you can use the following resource block:

```hcl
resource "jamfpro_policy" "jamfpro_policy_001" {
  name                          = "tf-jamf-health-check-001"
  enabled                       = true
  trigger_checkin               = false
  trigger_enrollment_complete   = false
  trigger_login                 = false
  trigger_network_state_changed = false
  trigger_startup               = false
  trigger_other                 = "USER_INITIATED" // "USER_INITIATED" for self service trigger , "EVENT" for an event trigger
  frequency                     = "Ongoing"
  retry_event                   = "none"
  retry_attempts                = -1
  notify_on_each_failed_retry   = false
  target_drive                  = "/"
  offline                       = false
  category_id                   = -1
  site_id                       = -1

  scope {
    all_computers = false
    all_jss_users = false

    computer_ids       = [16, 20, 21]
    computer_group_ids = sort([78, 1])

    exclusions {
      computer_ids                         = [16, 20, 21]
      computer_group_ids                   = sort([118, 1])
    }
  }

  self_service {
    use_for_self_service            = true
    self_service_display_name       = "Jamf Health Check"
    install_button_text             = "Run"
    reinstall_button_text           = "Run"
    self_service_description        = "This policy will run a health check and results can be found in policy logs"
    force_users_to_view_description = false
    feature_on_main_page            = false
  }

  payloads {
    scripts {
      id          = 123
      priority    = "After"
    }
  }
}
```

This resource will create a Policy object in Jamf Pro with the name `tf-jamf-health-check-001`, with a Script payload attached. It will also scope the policy to some computers using their computer IDs and some computer groups with their IDs. There is also some exclusions using the same methods. It will also set the policy to be run via self service. The required fields in this resource are the name, script contents and priority. For more information on other attributes and optional attributes you can see the Terraform Registry link below.

The required fields for a policy resource are enabled, name, scope and payload.

Once you apply this run, the policy will be created in the linked Jamf Pro tenant.

You can see more about policies on the policy [Terraform Registry](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/policy) webpage.

#### Deploying a Health Check Policy - Exercise 1.5

In this exercise, you will create the resources above and deploy the script to Self Service.

Follow the steps below to create the Self Service Health Check:

1. Create a new folder in your project in the working directory and name it `scripts`
2. In the `/script` directory, create a new file called `healthCheck.sh`
3. Copy the Health Check script and paste it into the `healthCheck.sh` file
4. Save the file
5. Create a new file in your project in the working directory and name it `scripts.tf`
6. Using the example of the Script resource above, create a script resource and point it to the `healthCheck.sh` file by using the following `file("files/scripts/healthCheck.sh")`
7. Run your terraform and upload your script by running the `terraform plan` & `terraform apply` command in the terminal in the working directory
8. Now that the script is uploaded, browse to your Jamf Pro tenant and find the ID of the script that has been uploaded
9. Once you have the script ID, you can create the Policy
10. Create a new file in your project in the working directory and name it `policies.tf`
11. Using the policy resource example above, create a policy that uses the script that was previously uploaded by pointing the script payload to the script ID you had from the previous step, ensure that the scope of the policy is set to **All Devices**
12. Run your terraform and create your policy by running the `terraform plan` & `terraform apply` command in the terminal in the working directory

---

## Exercise 2 - API Roles & Clients

In this exercise, we are going to look at the basics of creating an API Role and Client. This is useful when working on automation and wanting to create scripts that use the Jamf Pro API endpoints. This Exercise will cover the following topics:

- [API Roles](#api-roles)
- [API Clients](#api-clients)

For more information on any of the resources we are going to create today, you can see the full breakdown from the schema on the [Terraform Registry](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources) webpage.

### API Roles

Creating API Roles can be useful for creating new scripts, automations and integrating applications. To create an API Role using Terraform, you can use the following resource:

```hcl
resource "jamfpro_api_role" "jamfpro_api_role_001" {
  display_name = "all-jamf-pro-privileges-11.12"
  privileges = ["Create API Integrations",
  "Create API Roles"]
}
```

Everything in this resource is required. It will require the `display_name` and the `privileges` list. The privileges list will be a list of strings that represent the permissions allowed for this role. A full list of privileges can be found on the Terraform registry.

You can see more about API Roles on this [Terraform Registry](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/api_role) webpage.

### API Clients

Creating API Clients in Terraform is similar to creating API Roles, but this will be used to create the Client ID and Client Secret that utilises the API Role. The following API Client resource block is how it will be created using Terraform:

```hcl
resource "jamfpro_api_integration" "jamfpro_api_integration_001" {
  display_name = "tf-localtest-api-integration-001"
  enabled = true
  access_token_lifetime_seconds = 7200
  authorization_scopes = [jamfpro_api_role.jamfpro_api_role_001.display_name]
}
```

This resource has 3 required attributes, the `display_name`, `enabled` and `authorization_scopes`. You can find out more about this resource on the Terraform registry.

This resource block brings up an important feature of Terraform which makes it extremely flexible and intelligent. On the 'authorization_scopes' attribute, the attribute is directly pointing to another resource that was created earlier. In this instance, it is pointing to the API Role created in the previous section. This can make creating resources extremely dynamic and prevent you from having to modify multiple resources when you need to make a change.

You can see more about API Clients on this [Terraform Registry](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/api_integration) webpage.

#### API Roles - Exercise 2.1 - Creating API Roles

In this exercise, you will create the above Jamf Pro API Role within your terraform project and push the change to your Jamf Pro instance.

Follow these steps:

1. Create a new file in your project in the working directory and name it `jamfpro_api_role.tf`
2. Add in the API role resource mentioned above and create a role. You can change the name attribute to anything you would like.
3. Add in some permissions that you would like, this can be anything, and you can find a list on the registry webpage.
4. Save the file
5. Run your terraform and create the API Role by running the `terraform plan` & `terraform apply` command in the terminal in the working directory
6. Verify that the changes have been successful by confirming in the Jamf Pro tenant

#### API Clients - Exercise 2.2 - Creating an API Client

In this exercise, you will create the above Jamf Pro API Client while pointing to the API Role that you created in the last exercise.

Follow these steps:

1. Create a new file in your project in the working directory and name it `jamfpro_api_integration.tf`
2. Add in the API integration resource mentioned above and create the API Client. You can change the name attribute to anything you would like.
3. Point the `authorization_scopes` attribute to your API role that was created in exercise 1. This is done by pointing to the value of {name of file}.{unique name of resource}.display_name
4. Save the file
5. Run your terraform and create the API Client by running the `terraform plan` & `terraform apply` command in the terminal in the working directory
6. Verify that the changes have been successful by confirming in the Jamf Pro tenant

---

## Exercise 3 - Enrolment

In this exercise, we are going to look at some Jamf Pro settings that are configured to allow users to enroll. The point of this exercise is to show how Terraform can be used to modify the Jamf Pro settings. This exercise will cover the following topics:

- [Configuring LAPS](#configuring-laps)
- [Configuring User-initiated Enrolment](#configuring-user-initiated-enrolment)

For more information on any of the resources we are going to create today, you can see the full breakdown from the schema on the [Terraform Registry](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources) webpage. You will be able to find all Jamf Pro settings resources on here.

**These setting can only be configured once. If this training is being completed in a team, ensure that no-one is configuring these settings at the same time**

### Configuring LAPS

Configuring settings is the same as configuring any other resource in Terraform. The setting that will be configured in this section will be the Local Admin Password Settings. To modify LAPS, you can use the following resource:

```
resource "jamfpro_local_admin_password_settings" "local_admin_password_settings_001" {
  auto_deploy_enabled                 = false
  password_rotation_time_seconds      = 3600
  auto_rotate_enabled                 = false
  auto_rotate_expiration_time_seconds = 7776000
}
```

There are no required attributes for this resource, only what is configured will be modified.

You can see more about API Roles on this [Terraform Registry](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/local_admin_password_settings) webpage.

### Configuring User-initiated Enrolment

Another settings page that is useful to configure is the User-initialed enrolment. This can be configured using the following resource in Terraform:

```
## Configure Jamf Pro User Initiated Enrollment Settings
resource "jamfpro_user_initiated_enrollment_settings" "jamfpro_uie_settings" {
  ## General Settings
  restrict_reenrollment_to_authorized_users_only  = true
  skip_certificate_installation_during_enrollment = true

  ## Computer Enrollment Settings
  user_initiated_enrollment_for_computers {
    enable_user_initiated_enrollment_for_computers = true
    ensure_ssh_is_enabled                          = true
    launch_self_service_when_done                  = true
    account_driven_device_enrollment               = true

    ## Managed Local Administrator Account
    managed_local_administrator_account {
      create_managed_local_administrator_account                    = true
      management_account_username                                   = "jamfadmin"
      hide_managed_local_administrator_account                      = true
      allow_ssh_access_for_managed_local_administrator_account_only = true
    }
  }

  ## Enrollment Messaging - English (this block is always required. It's built into the jamf gui)
  messaging {
    language_code                                   = "en"
    language_name                                   = "english"
    page_title                                      = "Welcome to Device Enrollment"
    username_text                                   = "Username"
    password_text                                   = "Password"
    login_button_text                               = "Log In"
    device_ownership_page_text                      = "Select your device type"
    personal_device_button_name                     = "Personal Device"
    institutional_ownership_button_name             = "Company Device"
    personal_device_management_description          = "Your personal device will be managed with minimal restrictions"
    institutional_device_management_description     = "This company device will be fully managed"
    enroll_device_button_name                       = "Enroll Device"
    eula_personal_devices                           = "By enrolling, you agree to allow management of your personal device"
    eula_institutional_devices                      = "This device is subject to management policies as per company guidelines"
    accept_button_text                              = "Accept"
    site_selection_text                             = "Select your site"
    ca_certificate_installation_text                = "Install CA Certificate"
    ca_certificate_name                             = "Company Root CA"
    ca_certificate_description                      = "This certificate allows secure communication with company servers"
    ca_certificate_install_button_name              = "Install CA"
    institutional_mdm_profile_installation_text     = "Install Management Profile"
    institutional_mdm_profile_name                  = "Company MDM Profile"
    institutional_mdm_profile_description           = "This profile allows management of your company device"
    institutional_mdm_profile_pending_text          = "Installing MDM profile..."
    institutional_mdm_profile_install_button_name   = "Install"
    personal_mdm_profile_installation_text          = "Install Personal Device Profile"
    personal_mdm_profile_name                       = "Personal Device Profile"
    personal_mdm_profile_description                = "Limited management profile for personal devices"
    personal_mdm_profile_install_button_name        = "Install Profile"
    user_enrollment_mdm_profile_installation_text   = "Install User Enrollment Profile"
    user_enrollment_mdm_profile_name                = "User Enrollment Profile"
    user_enrollment_mdm_profile_description         = "Profile for user-based enrollment"
    user_enrollment_mdm_profile_install_button_name = "Install"
    quickadd_package_installation_text              = "Install Management Software"
    quickadd_package_name                           = "Company MDM Agent"
    quickadd_package_progress_text                  = "Installing management software..."
    quickadd_package_install_button_name            = "Install Software"
    enrollment_complete_text                        = "Enrollment Complete! Your device is now managed."
    enrollment_failed_text                          = "Enrollment Failed. Please try again."
    try_again_button_name                           = "Try Again"
    view_enrollment_status_button_name              = "Check Status"
    view_enrollment_status_text                     = "Check your enrollment status"
    log_out_button_name                             = "Log Out"
  }

  ## Directory Service Group Enrollment Settings

  ## All Directory Service Users (Required when managing other directory_service_group_enrollment_settings blocks)
  ## This is a special group that always exists as ID 1 and cannot be created or destroyed
  directory_service_group_enrollment_settings {
    id                                                                       = "1" // Must be provided
    allow_group_to_enroll_institutionally_owned_devices                      = true
    allow_group_to_enroll_personally_owned_devices                           = false
    allow_group_to_enroll_personal_and_institutionally_owned_devices_via_ade = true
    require_eula                                                             = true
    ldap_server_id                                                           = "-1"
    directory_service_group_name                                             = "All Directory Service Users"
    directory_service_group_id                                               = "-1"
    site_id                                                                  = "-1"
  }

  ## Other groups
  directory_service_group_enrollment_settings {
    allow_group_to_enroll_institutionally_owned_devices                      = false
    allow_group_to_enroll_personally_owned_devices                           = false
    allow_group_to_enroll_personal_and_institutionally_owned_devices_via_ade = false
    require_eula                                                             = true
    ldap_server_id                                                           = data.jamfpro_cloud_idp.by_name.id // LDAP or cloud idp
    directory_service_group_name                                             = "Test M365 account"
    directory_service_group_id                                               = "27230740-e063-4931-be75-f5e9b2e4ad53"
    site_id                                                                  = "-1"
  }

  directory_service_group_enrollment_settings {
    allow_group_to_enroll_institutionally_owned_devices                      = true
    allow_group_to_enroll_personally_owned_devices                           = false
    allow_group_to_enroll_personal_and_institutionally_owned_devices_via_ade = false
    require_eula                                                             = true
    ldap_server_id                                                           = data.jamfpro_cloud_idp.by_name.id // LDAP or cloud idp
    directory_service_group_name                                             = "Test Team"
    directory_service_group_id                                               = "a2327741-8784-40bf-aa3b-7fb979ea8658"
    site_id                                                                  = "-1"
  }
}
```

There are no required attributes in this resource, but many of them are required to properly implement User-initiated enrolment. There have been a few attribute blocks removed, such as the Mobile Device enrolment. This is just to shorten this resource block for this page. A full list of attributes is the Terraform Registry page.

You can see more about API Roles on this [Terraform Registry](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/user_initiated_enrollment_settings) webpage.

#### Enrolment - Exercise 3.1 - Configuring LAPS

**(Optional)**

In this exercise, you will use what you learned in the first section of this exercise and implement the LAPS configuration.

Follow these steps:

1. Create a new file in your project in the working directory and name it `jamfpro_local_admin_password_settings.tf`
2. Add in the resource mentioned in the LAPS section above and configure the LAPS settings.
3. Save the file
4. Run your terraform and create the LAPS configuration by running the `terraform plan` & `terraform apply` commands in the terminal in the working directory
5. Verify that the changes have been successful
6. **Optional - If working in a team** Clean up the configuration by running the `terraform destroy` command

#### Enrolment - Exercise 3.2 - Configuring User-Initiated Enrolment

**(Optional)**

In this exercise, you can customise the User-initiated enrolment as you like. There are a lot of attributes and settings in this payload, so play around with the settings and find what works best for your organisation.

Follow these steps:

1. Create a new file in your project in the working directory and name it `jamfpro_user_initiated_enrolment.tf`
2. Add in the resource mentioned in the enrolment section above and configure the user-initiated enrolment settings to your liking.
3. Save the file
4. Run your terraform and create the User-Initiated Enrolment configuration by running the `terraform plan` & `terraform apply` commands in the terminal in the working directory
5. Verify that the changes have been successful
6. **Optional - If working in a team** Clean up the configuration by running the `terraform destroy` command

---

**🎉 Congratulations!** You've completed Module 5-01 and now understand the basic Jamf Pro Terraform configurations. You've built real Jamf Pro configuration and deployed some resources.

**➡️ Ready for Module 5-02?** Let me know when you'd like to continue with Jamf Pro Terraform Resources - where we'll learn how to configure more resources that you use for everyday management of macOS devices!

---

---

## 🔗 **Next Steps**

Ready to continue your Terraform journey? Proceed to the next module:

**➡️ [Module 5-02: Jamf Terraform Intermediate](./module_05-02_jamf_terraform_intermediate.md)**

Learn intermediate Jamf Pro resource configuration.
