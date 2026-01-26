# 🧩 Module 6: Importing Existing Jamf Pro Resources into Terraform

**⏱️ Duration**: 40 minutes  
**🎯 Difficulty**: Intermediate to Advanced  
**📋 Prerequisites**: Completed Modules 1-5

## 🎯 Learning Objectives

By the end of this module, you will be able to:

- ✅ Understand what the **`import` block** does in Terraform.
- ✅ Use the **`terraform import` command**.
- ✅ Import Jamf Pro resources into your Terraform state.
- ✅ Verify and manage imported resources.
- ✅ Practice through guided exercises.

---

## Overview

When managing Jamf Pro with Terraform, you’ll often start with existing configurations already in your Jamf instance — things like policies, scripts, or smart groups.  
Instead of recreating these manually in code, Terraform allows you to **import** existing resources into your state.

---

## 1. What Is the Terraform Import Feature?

Terraform keeps track of resources it manages in a **state file** (`terraform.tfstate`).  
If a resource exists in Jamf Pro but not in that state file, Terraform doesn’t know it exists — until you import it.

The import process connects an **existing real-world resource** (e.g., a Jamf Policy) with a **Terraform resource block** in your configuration.

### Before Import

Terraform plan output:

```
# jamfpro_policy.my_policy will be created
```

Terraform doesn’t know the policy already exists in Jamf Pro.

### After Import

Terraform understands the resource exists and manages it going forward.

---

## 2. The Two Ways to Import

Terraform provides **two ways** to perform imports:

### A. Using the `terraform import` Command (Classic Method)

This is the traditional way to import existing infrastructure.

#### Syntax

```bash
terraform import <RESOURCE_ADDRESS> <EXTERNAL_ID>
```

**The Resource Address** is in the following syntax: `resourceType.resourceName`. The resource address `jamfpro_policy.gordons_policy` would have the following resource:

```hcl
resource "jamfpro_policy" "gordons_policy" {
  name = "Gordons example policy"

  # ... additional configuration ...
}
```

**The external ID** will be the ID of the resource. In the example of Jamf Pro, this would be the ID of each resource, i.e. the Policy ID (found in the URL).

#### Example (Jamf Pro Policy)

```bash
terraform import jamfpro_policy.login_window_policy 42
```

Where:

- `jamfpro_policy` → The Terraform resource type.
- `login_window_policy` → The local name in your configuration.
- `42` → The Jamf Pro policy ID (found in the Jamf Pro URL or API).

After import, Terraform writes this mapping to your state file.

#### Steps to import

1. Write a basic resource block (empty or partial) in your `.tf` file:
   ```hcl
   resource "jamfpro_policy" "login_window_policy" {}
   ```
2. Run the import command with the ID.
3. Run `terraform plan` to verify.
4. Run `terraform show` to inspect imported attributes.

> 📝 **Note:** The configuration file won’t be automatically populated — you’ll need to update it manually or use the `terraform show -json` output to help build it.

---

### B. Using the `import` Block (Declarative Method)

Introduced in **Terraform v1.5**, the `import` block allows you to declare imports as part of your Terraform configuration — making them **repeatable and documented**.

#### Example

```hcl
import {
  to = jamfpro_policy.login_window_policy
  id = "42"
}
```

#### Benefits

- Keeps imports in version control.
- Reusable across environments.
- Integrates with Terraform Cloud and CI/CD pipelines.
- Enables `terraform plan` to preview imports before applying.

#### Steps

1. Define your resource and import block:

   ```hcl
   resource "jamfpro_policy" "login_window_policy" {}

   import {
     to = jamfpro_policy.login_window_policy
     id = "42"
   }
   ```

2. Run:
   ```bash
   terraform plan
   terraform apply
   ```
3. Terraform will add the resource to your state just like the CLI method.

---

## 3. Verification and Troubleshooting

After importing, check your resource:

```bash
terraform state list
terraform state show jamfpro_policy.login_window_policy
```

If Terraform shows the correct attributes, the import was successful.

**Common issues:**
| Problem | Cause | Solution |
|----------|--------|-----------|
| Resource not found | Wrong ID | Check the Jamf Pro API ID or URL |
| Resource arguments mismatch | Schema differences | Adjust your `.tf` configuration |
| Import doesn’t show attributes | Empty resource block | Run `terraform show` and update the `.tf` file manually |

---

## 4. Exercises

### 🧠 Exercise 1: Import an Existing Jamf Script

1. Log in to your Jamf Pro dashboard.
2. Find a script you’ve already uploaded.  
   Note its **ID** from the URL (e.g., `/scripts.html?id=23`).
3. In your Terraform config:
   ```hcl
   resource "jamfpro_script" "login_script" {}
   ```
4. Run:
   ```bash
   terraform import jamfpro_script.login_script 23
   ```
5. Verify with:
   ```bash
   terraform state show jamfpro_script.login_script
   ```
6. Update the `.tf` file with attributes from `terraform show`.

---

### 🧠 Exercise 2: Use the Import Block

1. Find another resource that is already in the Jamf Pro tenant.
2. Add this to your `.tf` file:
   ```hcl
   import {
     to = jamfpro_script.login_script # Or another resource
     id = "23" # Or another ID
   }
   ```
3. Run `terraform plan` and confirm Terraform plans to import.
4. Run `terraform apply`.
5. Verify using:
   ```bash
   terraform state list
   ```
6. 🎉 You’ve now declared an import declaratively!

---

### 🧠 Bonus Exercise: Compare CLI vs Import Block

1. Import one resource with the CLI.
2. Import another using an `import` block.
3. Discuss:
   - Which method fits better for CI/CD pipelines?
   - Which provides better documentation?
   - What happens if you remove the import block later?

---

## 5. Key Takeaways

- **`terraform import`** (CLI) → Quick one-time import.
- **`import` block** → Declarative, reusable, and version-controlled.
- Both link existing Jamf Pro resources with Terraform state.
- Always verify imports and update your `.tf` configuration for accuracy.

**➡️ Next Steps**: Ready to explore **Terraform Providers**, dive into learning about the different providers offered in terraform.

---

---

## 🔗 **Next Steps**

Ready to continue your Terraform journey? Proceed to the next module:

**➡️ [Module 7: Terraform Providers] (./module_07_terraform_providers.md)**

Learn more about the import command and block.

---
