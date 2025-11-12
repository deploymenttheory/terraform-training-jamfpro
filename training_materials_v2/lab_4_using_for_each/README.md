# 🧪 Terraform Hands-On Labs

These labs reinforce the fundamentals you learned in the Terraform training module.  
They progress from basic resource creation to troubleshooting and resource dependencies.

---

## ⚙️ Lab 4: Working with Locals and For Each Loops

### 🎯 Objective

Learn how to create a resource block using a for each loop from a set of locals

### 🧩 Scenario

You have been provided with a local set of categories that need to be implemented into Jamf Pro.

Using the information provided, write the most efficient way of doing this.

### 🧰 Prerequisites

- Terraform installed
- A working directory (`terraform-labs/` or this forked repo)
- A configured provider (`main.tf` - this will be provided)
- Existing resources (`categories.tf` - These will be provided in this directory)
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
4. Create a category resource without any configuration:

```hcl
resource "jamfpro_category" "categories" {

}
```

5. Now using what you have learned about `for_each` loops, write an efficient implementation to create all of these categories:

```hcl
resource "jamfpro_category" "categories" {
    for_each = local.jamf_categories
    name     = each.key
    priority = each.value
}
```

This implementation will loop through each of the categories within the set and create a new Jamf Pro category _for each_ of the entries, using the key (the name) for the name and the value (the number) for the priority.
