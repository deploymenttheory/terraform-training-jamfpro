# 🧱 Module 02 - Expressions Basics

This module will introduce the basics of Terraform Expressions.

This module presumes you know the following:

- You have completed module 1 in this directory
- You know how to create resources
- You have a working Terraform Setup

## 🎯 Learning Objectives

By the end of this module, participants will:

- Understand what **locals**, **for each**, **splat expressions** and **dynamic blocks** are.
- Be able to create each expression and use it to dynamically create resources
- Have an understanding of what situations you would use each
- Be able to use dependencies within resources (i.e. point to smart groups resources from policy resources)

---

## Locals — “named sticky notes for values”

### Plain-language idea

Imagine you put a sticky note on your monitor that says **“Category = Security”** so you don’t have to type that phrase over and over. In Terraform a `local` is the same idea: a named piece of data you reference repeatedly. It helps keep things consistent and easy to change.

### Why use locals

- Avoid repeating the same string/number in many places.
- Centralise values so updates are one-place changes.
- Create simple data structures (lists, maps) that you can iterate over.

### Simple example

```hcl
locals {
  default_category = "Security"
  team_email       = "it-support@example.com"
}
```

Then use the values:

**This is a fictional Jamf Pro Policy to show the example**

```hcl
resource "jamfpro_policy" "enforce_antivirus" {
  name          = "Enforce Antivirus"
  category_name = local.default_category       # uses the sticky note
  notes         = "Contact: ${local.team_email}"
}
```

If you later change default_category in locals, every policy that references it updates consistently.

### More useful: a map of categories → priorities

You can also use different types of values, for example a map or set to build out resources.

In this example, you are creating a local of `jamf_categories`, and then building out a resource using a for_each (which will be explained later).

```hcl
locals {
  jamf_categories = {
    "Security"             = 1
    "Compliance"           = 2
    "Endpoint Protection"  = 3
    # ... etc ...
  }
}

resource "jamfpro_category" "categories" {
    for_each = local.jamf_categories
    name     = each.key
    priority = each.value
}
```

If you wanted to get a specific value (in this case a priority) for a category, you can reference `local.jamf_categories["Security"]` to get `1`.

---

### Exercises - Creating a local

1. Create a `locals.tf` file with the following configuration:

```hcl
locals {
    default_category = "Security"
}
```

2. Use the local:

```hcl
resource "local_file" "example" {
    content  = "Category: ${local.default_category}"
    filename = "exercise1.txt"
}
```

3. `terraform init` → `terraform apply` → inspect `exercise1.txt`

---

## Splat expressions — “grab the same field from many items at once”

### Plain-language idea

Imagine you have 10 Post-it notes, each with an employee’s name and phone number. You want a list of all phone numbers. Instead of reading each note one-by-one, you use a filter that collects the phone number from every note in one go. That’s what a splat expression does for Terraform resources: it pulls the same attribute (like `id` or `name`) from a group of resources and returns a list.

### When you’ll use this

- You created many resources (e.g., many Jamf categories or policies) and you want a single list of their IDs or names (for outputs, for input to another resource, or to show in a report).
- You want to pass a list of IDs into another resource (e.g., a policy that must reference multiple smart-group IDs).

### Form

```hcl
resource_type.resource_name[*].attribute
```

### Example:

From the example above where we create a number of categories from a map, you can use a splat expression to return all the IDs of the categories using the following syntax:

```hcl
jamf_category.categories[*].id
```

This returns a list of `id` values for all `jamf_category.categories` resource.

> Note: the `[*]` is the splat. It means “from every instance of this resource, give me this attribute”.

### Important details

The result is a list (an ordered collection). Use it when you need a list.

If resources were created via a for_each or count, the splat still gathers values — but the order of items can be unpredictable if you used a map. If order matters, sort the list explicitly.

### Jamf example combining with locals + for_each

Suppose you create many categories with for_each (we’ll explain for_each next). After creation, you can collect their IDs this way:

```hcl
resource "jamf_category" "categories" {
  for_each = local.jamf_categories
  name     = each.key
  priority = each.value
}

output "category_ids" {
  value = jamf_category.categories[*].id
}
```

`category_ids` becomes a list of all created category IDs.

---

### Exercise - Using a splat

1. Use the `jamf_categories` `locals` and `jamf_category` resource block above (or use a dummy local_file resource with for_each).
2. `terraform apply`
3. `terraform output category_ids` — you should see a list (e.g., `["abc123", "def456", ...]`).

## `for_each` — “duplicate a resource for every item in a list or map”

### Plain-language idea

Imagine you have a spreadsheet of 10 standard Jamf categories you need to create. Instead of manually creating each category in the console, you write one template (a policy or category definition) and tell Terraform: **“Create one of these for each row in my spreadsheet.”** That’s what `for_each` does: it runs the same resource block once for each item in a set, list, or map.

## Why `for_each` instead of repeating blocks

- Cleaner code (single resource block, not many near-duplicates).
- If you update the template, all created items can be updated consistently.
- Terraform can create, change, or delete only the specific items that changed — safer and clearer.

### `for_each` accepts:

- a **set or list** (like `["a","b","c"]`) → `each.value` is the item itself
- a **map** (like `{ name = 1, other = 2 }`) → `each.key` (name/other) is the map key; `each.value` (1 or 2) is the map value

Using a map is very common when you have a name → priority pair (as with your categories).

### Example (create Jamf categories from a map)

```hcl
locals {
  jamf_categories = {
    "Security"            = 1
    "Compliance"          = 2
    "Endpoint Protection" = 3
  }
}

resource "jamf_category" "categories" {
  for_each = local.jamf_categories

  name     = each.key
  priority = each.value
}
```

Here:

- Terraform will create three `jamf_category` resources.
- Each resource is addressable by `jamf_category.categories["Security"]`, `jamf_category.categories["Compliance"]`, etc.
- Use `each.key` (the name) and `each.value` (the priority number) inside the resource.

### Accessing resources created by `for_each`

- Single resource: `jamf_category.categories["Security"].id`
- All ids (splat): `jamf_category.categories[*].id` (returns a list)

### `for_each` vs `count` (short, important)

- `count` uses numeric indexing (`resource.name[0]`, `resource.name[1]`). It’s less clear when items are added/removed because indices can shift.
- `for_each` uses keys (maps or sets) and manages each item by key, so Terraform can add/remove individual items with less surprise.
- **Prefer for_each when working with named items like Jamf categories.**

---

## Common pitfalls and how to avoid them (plain advice)

- Pitfall: Using the same literal many times (e.g., "Security") and later changing only one place.
- Fix: Use locals to centralise strings and numbers.

- Pitfall: Using count when you have named items — leads to index-shift problems.
- Fix: Prefer for_each with maps (keeps items keyed by name).

- Pitfall: Expecting splat result order to match your map order.
- Fix: If order matters, explicitly sort the list: sort(jamf_category.categories[*].name) or use toset()/tolist() with sort().

- Pitfall: Relying on each.key being stable if you rename keys in your map.
- Fix: Treat each.key as the identity; renaming a key in the map is effectively creating a new resource + deleting the old one. If renaming is needed, plan for re-creation.

- Pitfall: Thinking locals are secret storage — they appear in plan and state if used to build resources.
- Fix: Don’t store secrets in locals; use proper secret management (variables with sensitive = true, or dedicated secret stores).

## Quick reference cheatsheet

**locals**: `local.NAME` — single place to hold values (strings, lists, maps).

```hcl
locals { foo = "value" }
```

**for_each** inside a resource:

```hcl
resource "jamf_category" "categories" {
  for_each = local.jamf_categories
  name     = each.key
  priority = each.value
}
```

**splat** to get the same attribute from all instances:

```hcl
jamf_category.categories[*].id
```

**access single instance (for_each-created):**

```hcl
jamf_category.categories["Security"].id
```

## Closing tips for non-dev learners

- Treat Terraform files like a single source of truth — it’s the code that describes how your Jamf environment should look.
- Start with small changes: create one category, one policy. Confirm the results in Jamf.
- Use terraform plan often — it tells you exactly what Terraform will do before it does it.
- Keep your locals organized (a single locals.tf file is a good pattern).
- If something unexpected happens, terraform plan + terraform state list are your friends.