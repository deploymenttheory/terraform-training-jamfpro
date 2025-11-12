# 🧱 Module 01 - Terraform Basics

This module will introduce the basics of Terraform and working with Configuration as Code.

This module presumes you know the following:

- You understand what Configuration as Code is.
- You have an understanding of what Terraform as a concept is.

## 🎯 Learning Objectives

By the end of this module, participants will:

- Understand what **providers**, **resources**, and the **state file** are in Terraform.
- Be able to identify the structure of a resource block and its key components.
- Use the Terraform commands `plan`, `apply`, and `destroy` to manage infrastructure.
- Understand where to look for documentation

---

## 🧩 1. Introduction to Providers

### What is a Provider?

A **provider** is a plugin that lets Terraform talk to an external system — such as AWS, Azure, Jamf Pro, or GitHub.

Each provider knows how to:

- Authenticate with that system
- Read, create, update, and delete resources
- Map Terraform configuration to real-world APIs

Think of a provider as a **translator** between Terraform and your environment.

### Example

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
```

This tells Terraform:

> "Use the AWS provider, and work in the us-east-1 region."

For Jamf Pro, it might look like:

```hcl
terraform {
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = "0.26.0"
    }
  }
}

provider "jamfpro" {
    url = "https://yourcompany.jamfcloud.com"
    username = var.jamf_username
    password = var.jamf_password
}
```

### Key Concept

- You can use multiple providers in a single Terraform configuration.
- Providers are versioned — you can lock them to specific versions for consistency.

### 🧠 Exercise (Walkthrough)

1. In your working directory, create a file called provider.tf.
2. Add the Jamf provider block.
3. Configure the provider with variables required.
   - You may want to look at the documentation to see what is required.
4. Run `terraform init` — this downloads the provider plugin.

## 📦 Introduction to the Terraform State File

### What is the State File?

Terraform keeps track of everything it manages in a file called terraform.tfstate.

This file records:

- What resources exist
- Their configuration
- Relationships between them

Think of it like Jamf’s inventory database — it tells Terraform what’s already there.

### Why It Matters

The state file allows Terraform to know what needs to be changed.

It prevents Terraform from recreating resources unnecessarily.

It enables drift detection — spotting changes made outside Terraform.

### ⚠️ Important Notes

Never edit the state file manually.

Don’t share it casually — it can contain sensitive info (like credentials).

For teams, use remote state storage (e.g., S3, Terraform Cloud).

### 🧠 Exercise (Walkthrough)

1. Run terraform apply on a simple resource.
2. Open terraform.tfstate and inspect what’s inside (read-only!).
3. Notice how Terraform records the resource ID and attributes.

## 🧱 3. Introduction to What a Resource Is

### What is a Resource?

A resource is the fundamental building block in Terraform.

Each resource represents one real-world object — like:

- An AWS S3 bucket
- A Jamf Smart Group
- An Azure Virtual Machine

Every resource belongs to a provider and defines what you want to exist.

### Example

```hcl
resource "aws_s3_bucket" "example" {
  bucket = "my-terraform-demo-bucket"
  acl    = "private"
}
```

Terraform will ensure that a private S3 bucket called `my-terraform-demo-bucket` exists.

The resource block is built up of a few key aspects:

- The block that you are creating, in this case a `resource`. This tells Terraform that you are wanting to create a new resource for the provider that you are using.
- The next section, `"aws_s3_bucket"`, tells Terraform what type of resource you are wanting to create. In this case, a S3 Bucket in AWS.
- The last section is a unique identifier. This unique identifier is `"example"`. This identifier is for Terraform and has nothing to do with what is actually created within AWS. It is only used to identify the resource within the Terraform state file.
- The attributes within this block are the configuration of the S3 Bucket. This is what will actually be configured in AWS.

The following section will explain this further.

## 🧩 4. Structure of a Resource

Each resource follows this structure:

```hcl
resource "<PROVIDER>_<TYPE>" "<NAME>" {
  # Configuration
}
```

## 🧱 Components

**1. Resource Type**

Defined by the provider and type of object.

Examples:

- `aws_instance`
- `jamf_policy`
- `azure_resource_group`

**2. Resource Name**

A local name used to reference the resource within Terraform.

Example:

```hcl
resource "aws_s3_bucket" "example" { ... }
```

Here, `example` is the local identifier.

You can reference this elsewhere in Terraform like:

```hcl
bucket = aws_s3_bucket.example.bucket
```

**3. Configuration**

Inside the `{}` block are settings specific to that resource type.

Example (Jamf):

```hcl
resource "jamf_policy" "install_chrome" {
  name          = "Install Google Chrome"
  trigger       = "CHECK-IN"
  enabled       = true
  script_id     = jamf_script.chrome.id
  category_name = "Applications"
}
```

This describes what the Jamf policy should look like.

---

### 💡 Different Types of Resources

| Type                 | Example                        | Description                                           |
| -------------------- | ------------------------------ | ----------------------------------------------------- |
| **Managed Resource** | `aws_s3_bucket`, `jamf_policy` | Terraform creates and manages this                    |
| **Data Source**      | `data "aws_ami" "latest"`      | Terraform _reads_ existing data but doesn’t manage it |
| **Module Output**    | `module.network.vpc_id`        | Comes from another Terraform module                   |

---

### 🧠 Exercise

1. Create a simple resource in your main.tf.
2. Change one attribute (e.g., name or tag).
3. Run terraform plan and observe the difference.

---

## ⚙️ 5. Terraform Workflow — Plan, Apply, Destroy

These are the core **Terraform lifecycle commands**.

### 🧩 `terraform plan`

- Previews what Terraform will do.
- Compares your .tf files with the current state.
- Shows actions in three categories:
  - \+ create
  - ~ modify
  - \- destroy

**Example output:**

```bash
Plan: 1 to add, 0 to change, 0 to destroy.
```

Use it like a **Jamf policy “dry run”** — check before you execute.

### 🧩 `terraform apply`

- Executes the plan and makes the changes.
- Updates the state file to reflect the new configuration.

Example:

```bash
terraform apply
```

**Best practice**: Always run `plan` first, then `apply`.

### 🧩 `terraform destroy`

- Removes all resources defined in your configuration.
- Updates the state to reflect the deletions.

Example:

```bash
terraform destroy
```

Useful for cleaning up after a test or lab environment.

---

### 🧠 Exercise

1. Create a small resource (local, AWS, or Jamf).
2. Run `terraform plan` to preview.
3. Run `terraform apply` to create it.
4. Modify one parameter — re-run `plan` to see the change.
5. Finally, run `terraform destroy` to clean it up.

## 🏁 Summary

| Concept                    | Description                                  | Analogy for Jamf Engineers        |
| -------------------------- | -------------------------------------------- | --------------------------------- |
| **Provider**               | Plugin that connects Terraform to a platform | Like Jamf’s API connection        |
| **Resource**               | A single managed object                      | A Jamf policy, group, or script   |
| **State File**             | Tracks what Terraform manages                | Like Jamf’s device inventory      |
| **Plan / Apply / Destroy** | Terraform lifecycle commands                 | “Preview”, “Deploy”, and “Remove” |
