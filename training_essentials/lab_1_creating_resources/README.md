# 🧪 Terraform Hands-On Labs

These labs reinforce the fundamentals you learned in the Terraform training module.  
They progress from basic resource creation to troubleshooting and resource dependencies.

---

## ⚙️ Lab 1: Creating Your First Resource

### 🎯 Objective

Learn how to define, initialize, plan, and apply a simple Terraform resource.

### 🧩 Scenario

You want to create a new resource in your environment — for example:

- An **S3 bucket** in AWS
- or a **Jamf Policy** in a sandbox Jamf instance

You’ll define it in Terraform and let Terraform build it for you.

### 🧰 Prerequisites

- Terraform installed
- A working directory (`terraform-labs/` or this forked repo)
- A configured provider (`main.tf` - this will be provided)
- Open the Terraform Registry documentation for the provider you are using (Jamf Pro Provider docs linked below)

[Jamf Pro Terraform Registry](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs)

### 🪜 Steps

1. Create your `terraform.tfvars` file

```hcl
jamfpro_instance_fqdn = "YOUR_JAMF_URL"
jamfpro_client_id     = "YOUR_CLIENT_ID"
jamfpro_client_secret = "YOUR_CLIENT_SECRET"
```

2. Initialise Terraform (`terraform init`)
3. Create a `resources.tf` file
4. Using the Terraform Registry documentation, create a simple resource that has no dependencies. If you are using the Jamf Pro provider, this could be something like a category or department.
5. Preview the changes using `terraform plan`
6. Apply the changes using `terraform apply`
7. Verify that the changes have been successful by browsing to the Jamf Pro UI
8. Clean up the resources by using `terraform destroy`
