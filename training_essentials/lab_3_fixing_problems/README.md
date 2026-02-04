# 🧪 Terraform Hands-On Labs

These labs reinforce the fundamentals you learned in the Terraform training module.  
They progress from basic resource creation to troubleshooting and resource dependencies.

---

## ⚙️ Lab 3: Fixing a Problem

### 🎯 Objective

Learn how to troubleshoot when there is an error in your configuration.

### 🧩 Scenario

An engineer has configured some resources and has asked you to look over the code for a peer review.

This code has some flaws. Your task is to find the issues and resolve them.

### 🧰 Prerequisites

- Terraform installed
- A working directory (`terraform-labs/` or this forked repo)
- A configured provider (`main.tf` - this will be provided)
- Existing resources (`policy.tf`, `computer_groups.tf`, `config_profiles.tf` & `scripts.tf` - These will be provided in this directory)
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
4. Now look through the files provided within this lab and find and correct the errors

> [!TIP]
> You may want to run a `terraform plan` to find some issues

### Answers

**Issues Found:**

<details>

  <summary>Click to reveal</summary>

1. `main.tf` - Variable for the instance FQDN was incorrect
2. `scripts.tf` - The `priority` attribute is not in quotes
3. `scripts.tf` - The `script_contents` is pointing to an incorrect file name
4. `computer_groups.tf` - The unique identifier for all resources is the same
5. `policy.tf` - The `frequency` attribute is incorrect
6. `policy.tf` - The `computer_ids` attribute in the `scope` block is not pointing to the ID correctly of the smart group

</details>
