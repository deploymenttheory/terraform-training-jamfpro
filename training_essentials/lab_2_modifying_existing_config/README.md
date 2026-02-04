# 🧪 Terraform Hands-On Labs

These labs reinforce the fundamentals you learned in the Terraform training module.  
They progress from basic resource creation to troubleshooting and resource dependencies.

---

## ⚙️ Lab 2: Modifying Existing Configuration

### 🎯 Objective

Understand how Terraform detects and applies changes when configuration is updated.

### 🧩 Scenario

You’ve been asked to modify an existing configuration — In this scenario, you are deploying a policy out through deployment rings, and would like to push the change out to the following groups:

- Test Ring (**Already Deployed**)
- First Ring
- Fast Ring (After deployed first)
- Broad (After deployed fast)

### 🧰 Prerequisites

- Terraform installed
- A working directory (`terraform-labs/` or this forked repo)
- A configured provider (`main.tf` - this will be provided)
- Existing resources (`policy.tf` & `computer_groups.tf` - These will be provided in this directory)
- Open the Terraform Registry documentation for the provider you are using (Jamf Pro Provider docs linked below)

[Jamf Pro Terraform Registry](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs)

### 🪜 Steps

1. Create your `terraform.tfvars` file

```hcl
jamfpro_instance_fqdn = "YOUR_JAMF_URL"
jamfpro_client_id     = "YOUR_CLIENT_ID"
jamfpro_client_secret = "YOUR_CLIENT_SECRET"
```

2. Within the resource files, change the locals variable `prefix` to your initials.
3. Initialise Terraform (`terraform init`)
4. Now that you have a working directory, you can now start to deploy the policy through the rings.
5. First, run a `terraform plan` and `terraform apply`. This will create the resources.
6. Now you have done that, modify the scope of the policy to add in the First deployment ring.
7. Run `terraform plan` again and check what the output is.
8. If the output is correct, run `terraform apply`.
9. Repeat steps 6 - 8 with Fast and Broad groups.
