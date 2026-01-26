# Module 5-03 - Advanced Jamf Pro Configuration

## _Duration: 2 hour | Labs: 7_ | Difficulty: 🟡 Intermediate\*

## 🎯 Learning Objectives

By the end of this module, you will be able to:

- ✅ Use expressions in the context of Jamf Pro resources
- ✅ Create Types and Values - Using data type handling
- ✅ Create String Templates - Using dynamic string construction
- ✅ Use Operators - Using mathematical and logic operations
- ✅ Create Conditional Expressions - Using If/else statements
- ✅ Use For Expressions - Developing Data transformation loops
- ✅ Create Splat Expressions - Collecting element extraction
- ✅ Use Dynamic Blocks - Creating Dynamic resource configuration

### 📚 Topics Covered

Now that you have had time to play around with the most common resources that will be used in the day to day of managing Jamf. This section will take you through some of the more advanced techniques that you can use in Terraform to make the code as dynamic as possible and allow you to do some pretty clever things with the management of your Jamf instance.

Overall, these advanced techniques can be referred to as 'Expressions' and will probably be referenced as expressions throughout this section.

**Expressions** are the building blocks of Terraform configurations that **compute and return values**. They can reference variables, perform calculations, transform data, and implement complex logic.

In this section, you will cover the following topics:

- [**Types and Values** - Data type handling](#-types-and-values)
- [**String Templates** - Dynamic string construction](#-string-templates)
- [**Operators** - Mathematical and logical operations](#-operators)
- [**Conditional Expressions** - If/else logic](#-conditional-expressions)
- [**For Expressions** - Data transformation loops](#-for-expressions)
- [**Splat Expressions** - Collection element extraction](#-splat-expressions)
- [**Dynamic Blocks** - Dynamic resource configuration](#-dynamic-blocks)

**Examples of Expressions**

```hcl
# Expression examples
locals {
  # Simple value expression
  department = "Engineering"

  # Mathematical expression
  policy_retry_limit = var.base_retry * 2

  # Conditional expression
  configuration_scope = var.environment == "production" ? "All Computers" : "Test Group"

  # For expression
  computer_names = [for i in range(3) : "Eng-MacBook-${i + 1}"]

  # String template
  profile_name = "${var.project}-Config-${local.department}-${random_id.suffix.hex}"
}
```

## Types and Values

Terraform uses expressions to define configuration in .tf files. Expressions are made up of values and types, which determine how Terraform interprets and validates your configuration.

Understanding types and values is key to writing clean, reusable modules — and will help when working with providers like the Jamf Pro provider we will be using in this course.

### Understanding Types and Values

#### Types

Terraform has several **primitive types**:

- **string** – text values

  Example: `"Hello world"`

- **number** – integers or decimals

  Example: `42`, `3.14`

- **bool** – true or false

  Example: `true`, `false`

And several **complex types**:

- **list(<TYPE>)** – an ordered sequence

  Example: `["macOS", "iOS", "tvOS"]`

- **map(<TYPE>)** – key/value pairs

  Example: `{ "admin" = "Alice", "viewer" = "Bob" }`

- **set(<TYPE>)** – an unordered collection of unique values

  Example: `["alpha", "beta", "gamma"]`

- **object({ … })** – a collection of named attributes with specified types

  Example:

  ```bash
  {
  username = "jamf-admin"
  enabled  = true
  roles    = ["read", "write"]
  }
  ```

- **tuple([ … ])** – a fixed-length ordered collection of potentially different types

  Example: `[ "macOS", 14, true ]`

#### Values

Values are the actual data that populate those types.

**Primitive Value** examples:

```
# string
name = "MacBook Pro"

# number (integer)
device_limit = 5

# number (float/decimal)
os_version = 14.2

# bool
enabled = true
```

**Complex Value** examples:

```
# list(string)
os_list = ["macOS", "iOS", "iPadOS"]

# list(number)
ports = [80, 443, 8080]

# map(string)
user_roles = {
  "alice" = "admin"
  "bob"   = "viewer"
}

# set(string)
unique_tags = toset(["alpha", "beta", "beta"])
# result is ["alpha", "beta"] because there is no duplicates (unique)

# object
device_info = {
  name    = "Jamf-managed Mac"
  enabled = true
  tags    = ["macOS", "laptop"]
}

# tuple
mixed_values = ["Mac", 14, true]
```

#### Type Conversion

Terraform will try to convert values when possible:

```hcl
# number can be used where string is expected
title = "Version ${1.0}"   # becomes "Version 1"
```

But not all conversions are allowed — e.g., `"abc"` cannot convert to a number.

#### Practical Examples

**Example 1:** Variable with a simple type:

```hcl
# Number type
variable "device_limit" {
  type    = number
  default = 10
}

# String type
variable "device_name" {
  type    = string
  default = "MacBook Pro"
}
```

**Example 2:** Variable with a complex type:

```hcl
# Object type
variable "device_info" {
  type = object({
    name    = string
    enabled = bool
    tags    = list(string)
  })
  default = {
    name    = "Jamf-managed Mac"
    enabled = true
    tags    = ["macOS", "laptop"]
  }
}

# List type
variable "macos_versions" {
  description = "List of supported macOS versions"
  type        = list(string)
  default = [
    "13.6",  # Ventura
    "14.5",  # Sonoma
    "15.0",  # Sequoia (example future release)
  ]
}
```

### Exercises

Now that we have covered some types and values, we will go over some exercises to develop the knowledge in practical examples.

#### Exercises 1 - Identify Types

Look at the following values. What type is each?

```hcl
"Jamf Pro"
false
["alpha", "beta", "gamma"]
{ "us" = "New York", "eu" = "Berlin" }
[ "Mac", 14, true ]
```

**Answer:**

<details>
  <summary>Click to reveal</summary>
  <ul>
    <li>String</li>
    <li>boolean</li>
    <li>list</li>
    <li>map</li>
    <li>tuple</li>
  </ul>
</details>

---

#### Exercise 2 - Defining a Variable

Write a variable that defines a list of OS versions (strings), with a default of at least 3 versions.

**Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "macos_versions" {
  description = "List of supported macOS versions"
  type        = list(string)
  default = [
    "13.6",  # Ventura
    "14.5",  # Sonoma
    "15.0",  # Sequoia (example future release)
  ]
}
```

</details>

---

#### Exercise 3 - Object Practice

Define a variable admin_user as an object with:

- `username` (string)
- `enabled` (bool)
- `roles` (list of strings)

Set the default to `"jamf-admin"`, `true`, and `["read", "write"]`.

**Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
  variable "admin_user" {
    type = object({
      username    = string
      enabled = bool
      roles    = list(string)
    })
    default = {
      username    = "jamf-admin"
      enabled = true
      tags    = ["read", "write"]
    }
  }
```

</details>

---

#### Exercise 4 - Bonus (Maps)

Create a map of department names to the number of devices they manage.

Example:

```hcl
it = 120
hr = 30
marketing = 45
```

**Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
  variable "department_devices" {
    type = map(number)
    description = "A map of departments and devices they manage"
    default = {
      it        = 120
      hr        = 30
      marketing = 45
    }
  }
```

</details>

### Wrap-Up

- Types define the shape of values.

- Values are the actual data.

- Terraform validates that values match expected types, preventing errors.

- Mastering this helps when defining reusable modules and provider configurations (e.g., Jamf Pro).

## String Templates

String templates let you insert values into strings dynamically using the syntax:

```hcl
"Hello, ${var.name}"
```

This is especially useful in Jamf Pro Terraform configurations where you need to build policy names, group names, or labels that include variables, for example, using naming conventions.

### Basic String Templates

This would be how you can use basic string templates by creating a variable of a device name and then outputting it in a sentence:

```hcl
# Create the variable
variable "device_name" {
  default = "MacBook"
}

# Use the Terraform output to display the sentence including the variable
output "greeting" {
  value = "Hello, ${var.device_name}"
}
```

**Result:**

```hcl
Hello, MacBook
```

### Using Multiple Expressions

You can also do this with using multiple expressions:

```hcl
variable "os" {
  default = "macOS"
}

variable "version" {
  default = "14.2"
}

output "full_os_name" {
  value = "${var.os} Version ${var.version}"
}
```

**Result:**

```hcl
macOS Version 14.2
```

### String Templates with Jamf Pro Resources

Imagine you want to name a **Jamf Pro Policy** based on the application it installs and the target OS:

```hcl
variable "app_name" {
  default = "Google Chrome"
}

variable "os" {
  default = "macOS"
}

resource "jamfpro_policy" "chrome_install" {
  name = "Install ${var.app_name} on ${var.os}"

  # ... other Jamf Pro policy arguments ...
}
```

**Resulting policy name in Jamf Pro:**

```hcl
Install Google Chrome on macOS
```

### Interpolation with Functions

String templates can use Terraform functions too. This example uses the lower() function to take an uppercase string and make it lowercase:

```hcl
variable "department" {
  default = "IT"
}

output "lowercase_dept" {
  value = "Department: ${lower(var.department)}"
}
```

**Result:**

```hcl
Department: it
```

### Heredoc Strings (Multiline Templates)

If you need multi-line scrips or messages in Jamf Pro (e.g., a custom script for a policy), use a heredoc:

```hcl
# Using the heredoc syntax of EOT to encapsulate the inline script:
resource "jamfpro_script" "inline_script" {
  name            = "tf-example-script-inline"
  script_contents = <<EOT
#!/bin/bash
echo "Welcome to ${var.department} Department!"
echo "This Mac is managed by Jamf Pro."
EOT
  os_requirements = "13.1"
  priority        = "BEFORE"
  info            = "Your script info here."
  notes           = ""

}
```

### Exercises

Now that you have had some examples of String Templates, here are some exercises to concrete the knowledge.

#### Exercise 1 - Simple Template

Write a String Template that outputs `Installing Zoom on macOS` (using variables `app_name = "Zoom"` and `os = "macOS"`)

**Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "app_name" {
  default = "Zoom"
}

variable "os" {
  default = "macOS"
}

output "full_os_name" {
  value = "Installing ${var.app_name} on ${var.os}"
}
```

</details>

---

#### Exercise 2 - Creating a Policy using Strings

Using what you learned in the previous modules, create a Jamf Pro policy, with a payload that performs a recon and with a resource named:

```hcl
Update Inventory for Marketing
```

**Don't scope it to anyone for now.**

(using variables `policy_type = "Update Inventory"` and `department = "Marketing"`)

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "policy_type" {
  default = "Update Inventory"
}

variable "department" {
  default = "Marketing"
}

resource "jamfpro_policy" "jamfpro_policy_001" {
  name                          = "${var.policy_type} for ${var.department}"
  enabled                       = false

  scope {
    all_computers = false
  }

  payloads {
    maintenance {
      recon                       = true
      reset_name                  = false
      install_all_cached_packages = false
      heal                        = false
      prebindings                 = false
      permissions                 = false
      byhost                      = false
      system_cache                = false
      user_cache                  = false
      verify                      = false
    }
  }
}


```

</details>

---

#### Exercise 3 - Create a Multiline Script

Write a heredoc string in an inline Jamf Pro Script that outputs the following when run:

```hcl
Hello, Alice!
Your Mac is enrolled in Jamf Pro.
```

(Use a variable `username = "Alice"` in the template)

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "username" {
  default = "Alice"
}

resource "jamfpro_script" "inline_script" {
  name            = "tf-example-script-inline"
  script_contents = <<EOT
#!/bin/bash
echo "Hello, ${var.username}"
echo "Your Mac is enrolled in Jamf Pro."
EOT
  priority        = "BEFORE"
}
```

</details>

### Wrap-Up

- String templates = dynamic text building.

- Syntax: `${expression}` inside quotes.

- Useful in Jamf Pro for policy names, group names, labels, and scripts.

- Works with variables and functions.

- Multiline templates (heredocs) are perfect for Jamf Pro scripts.

## Operators

Terraform supports a set of operators that let you combine, compare, and transform values in your configurations.
These are especially useful in Jamf Pro modules where you might want to:

- Decide if a policy should be enabled

- Compare OS versions

- Combine strings for naming conventions

- Work with numbers or counts of devices

### Arithmetic Operators

Arithmetic operators are used for numbers to compute calculations

```hcl
variable "base_devices" {
  default = 50
}

variable "extra_devices" {
  default = 10
}

output "total_devices" {
  value = var.base_devices + var.extra_devices
}
```

**Output:**

```hcl
60
```

Other arithmetic operators:

- \- (subtraction)

- \* (multiplication)

- / (division)

- % (modulus / remainder)

### Comparison Operators

Comparison operators are used to compare two values. The output results are either true or false.

- == (equal to)

- != (not equal to)

- \> (greater than)

- < (less than)

- \>= (greater or equal)

- <= (less or equal)

Example in a Jamf Pro context:

```hcl
variable "os_version" {
  default = 14
}

output "requires_upgrade" {
  value = var.os_version < 15
}
```

**Result:**

```
true
```

### Logical Operators

Logical operators are used for combining boolean values which then outputs either a True or False value.

- && (and)

- || (or)

- ! (not)

Example in Jamf Pro: enabling a policy only if the OS is macOS and the department is IT.

```hcl
variable "os" {
default = "macOS"
}

variable "department" {
default = "IT"
}

output "enable_policy" {
value = var.os == "macOS" && var.department == "IT"
}
```

**Result:**

```
true
```

### Practical Jamf Pro Example

Enable a policy only if `department = IT` and `OS = macOS`:

```hcl
variable "department" {
  default = "IT"
}

variable "os" {
  default = "macOS"
}

resource "jamfpro_policy" "security_updates" {
  name    = "Security Updates"
  enabled = var.department == "IT" && var.os == "macOS"

  # ... other jamf pro policy configurations ...
}
```

### Exercises

Now that we have gone over the different types of operators, here are some exercises to test your knowledge and implement some resources using what you have learned so far.

#### Exercise 1 - Arithmetic

If the **IT department manages 120 devices** and **HR manages 30 devices**, write an expression that outputs the **total number of devices**.

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "it_department" {
  default = 120
}

variable "hr_department" {
  default = 30
}

output "total_number_of_devices" {
  value = var.it_department + var.hr_department
}
```

</details>

---

#### Exercise 2 - Comparison

Write an expression that checks if the `os_version` variable is **greater than or equal to 14**.

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "os_version" {
  default = 15.6.1 # This can be anything
}

output "check_os_version" {
  value = var.os_version >= 14
}
```

</details>

---

#### Exercise 3 - Logical

Write a condition that returns `true` if **the app name is "Chrome"** OR **the app name is "Firefox"**.

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "app_name" {
  default = "Chrome" # This can be anything
}

output "check_os_version" {
  value = var.app_name == "Chrome" || var.app_name == "Firefox"
}
```

</details>

---

#### Exercise 4 - Jamf Pro Policy Example

Create a Jamf Pro policy resource that is only enabled if the department is `Engineering` and the OS is `macOS`. The policy should be named `Engineering macOS Policy`. The Payload can be anything, for simplicity, you can just enable the recon maintenance payload.

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "department" {
  default = "Engineering"
}

variable "operating_system" {
  default = "macOS"
}

jamfpro_policy "engineer_policy" {
  name                          = "${var.department} ${var.operating_system} Policy"
  enabled                       = var.department == "Engineering" && var.operating_system == "macOS"

  scope {
    all_computers = false
  }

  payloads {
    maintenance {
      recon                       = true
      reset_name                  = false
      install_all_cached_packages = false
      heal                        = false
      prebindings                 = false
      permissions                 = false
      byhost                      = false
      system_cache                = false
      user_cache                  = false
      verify                      = false
    }
  }
}
```

</details>

### Wrap-up

- **Arithmetic operators** work with numbers.

- **Comparison operators** evaluate relationships (==, <, !=, etc.).

- **Logical operators** (&&, ||, !) combine boolean values.

- Operators are powerful in Jamf Pro modules for conditional enabling, naming, and resource logic.

## Conditional Expressions

A conditional expression in Terraform lets you choose a value based on whether a condition is true or false.

The syntax is:

```hcl
condition ? true_value : false_value
```

This is similar to an **if/else** statement in programming languages.

It computes the **condition** and returns the first value (`true_value`) if the condition is true, or returns the second value (`false_value`) if the condition is false.

Let's take a look at some examples.

### Basic Example

Here is an example of checking if some policy is enabled. In this case we are setting the value to `true`:

```hcl
variable "is_enabled" {
  default = true
}

output "status" {
  value = var.is_enabled ? "Policy is ON" : "Policy is OFF" # Check if the 'var.enabled' variable/condition is True or False, then output the corrosponding value
}
```

**Result:**

```hcl
Policy is ON
```

### Conditional Expressions with Jamf Pro

Here are some examples that are specifically tied to Jamf Pro:

**Example 1 – Enable/Disable a Policy**

```hcl
variable "department" {
  default = "IT"
}

resource "jamfpro_policy" "vpn_policy" {
  name    = "Install VPN"
  enabled = var.department == "IT" ? true : false

  # ... other policy configurations ...
}
```

If `department = "IT"`, the policy is enabled. Otherwise, it’s disabled.

**Example 2 – Policy Naming**

```hcl
variable "os" {
default = "macOS"
}

resource "jamfpro_policy" "security_policy" {
name = var.os == "macOS" ? "macOS Security Policy" : "General Security Policy"
}
```

If the OS is `macOS`, the policy name is _macOS Security Policy_. Otherwise, it’s _General Security Policy_.

**Example 3 – Different Values for Groups**

```hcl
variable "device_type" {
default = "laptop"
}

resource "jamfpro_smart_computer_group" "device_group" {
name = var.device_type == "laptop" ? "Laptop Devices" : "Desktop Devices"

# ... other smart group configurations ...
}
```

If `device_type = "laptop"`, the group name is _Laptop Devices_. Otherwise, _Desktop Devices_.

### Nested Conditionals

You can chain multiple conditions together.

```hcl
variable "os" {
  default = "macOS"
}

variable "chip" {
  default = "arm"
}

output "build_type" {
  value = var.os == "macOS" ? (var.chip == "arm" ? "macOS Apple Silicon Build" : "macOS Intel Build") : "Other OS Build"
}
```

This expression is checking to see **if the OS is macOS**. If it is **not** macOS then the conditional will be **false** and state `Other OS Build`. But if it **is** macOS, then it falls into another conditional statement to then check if `var.chip == "arm"`, if this is **true**, then it will display `"macOS Apple Silicon Build"` and if **not** then `"macOS Intel Build"`

> [!TIP]
> Keep nested conditionals readable by formatting them across multiple lines. For more complex logic, consider locals or lookup() maps instead of long chains of ? : expressions.

### Exercises

Now that you have had some examples of Conditional Expressions, let's look at some exercises.

#### Exercise 1 - Policy Status

Write a conditional expression in a **Jamf Pro Policy** resource that sets `enabled = true` **only if** `department = "Engineering"`. Otherwise, it should be **false** using conditional expressions.

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "department" {
  default = "Engineering"
}

resource "jamfpro_policy" "eng_policy" {
  name    = "Engineering Policy"
  enabled = var.department == "Engineering" ? true : false

  scope {
    all_computers = false
  }

  payloads {
    maintenance {
      recon                       = true
      reset_name                  = false
      install_all_cached_packages = false
      heal                        = false
      prebindings                 = false
      permissions                 = false
      byhost                      = false
      system_cache                = false
      user_cache                  = false
      verify                      = false
    }
  }
}
```

</details>

---

#### Exercise 2 - Policy Naming

Write a conditional expression within a **Jamf Pro Policy** resource that sets the policy name to:

- `"Chrome for macOS"` if `os = "macOS"`,

- Otherwise, `"Chrome for Other OS"`.

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "operating_system" {
  default = "macOS"
}

resource "jamfpro_policy" "chrome_policy" {
  name    = var.operating_system == "macOS" ? "Chrome for macOS" : "Chrome for Other OS"
  enabled = true

  scope {
    all_computers = false
  }

  payloads {
    maintenance {
      recon                       = true
      reset_name                  = false
      install_all_cached_packages = false
      heal                        = false
      prebindings                 = false
      permissions                 = false
      byhost                      = false
      system_cache                = false
      user_cache                  = false
      verify                      = false
    }
  }
}
```

</details>

---

#### Exercise 3 - Device Groups

Create a **Jamf Pro Smart Group** that is named `"iOS Devices"` **if** `os = "iOS"`, **otherwise** `"Other Devices"`.

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "operating_system" {
  default = "iOS"
}

resource "jamfpro_smart_computer_group" "device_group" {
  name = var.operating_system == "iOS" ? "iOS Devices" : "Other Devices"

  # ... Leaving the criteria blank here. Not needed ...

}
```

</details>

---

#### Bonus (Nested Conditionals)

Create an **output** that evaluates:

- `"Apple Silicon Mac"` **if** `os = "macOS"` **and** `chip = "arm"`

- `"Intel Mac"` **if** `os = "macOS"` **and** `chip = "intel"`

- `"Non-Mac Device"` otherwise

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "operating_system" {
  default = "macOS"
}

variable "chip" {
  default = "arm"
}

output "device_output" {
  value = var.operating_system = "macOS" ? (var.chip = "arm" ? "Apple Silicon Mac" : "Intel Mac") : "Non-Mac Device"
}
```

</details>

### Wrap-up

- Conditional expression syntax: `condition ? true_value : false_value`

- Great for Jamf Pro configs:

  - **Enable/disable policies**

  - **Custom naming conventions**

  - **Dynamic group selection**

- Can be **nested** for more complex logic

## For Expressions

A **for expression** in Terraform lets you transform a list, set, or map into a new list, set, or map by applying an expression to each element.

This is useful in Jamf Pro Terraform configs for:

- Generating lists of app names

- Creating maps of departments to device groups

- Filtering items before using them in a resource

- creating multiple resources based on a list

### For Expression Syntax

**General Form** - This is typically the general form of a for expression. In English, it would read - For every item in a collection, perform this expression:

```hcl
[for item in collection : expression]
```

**With Filtering** - You can also perform this for expression while filtering based on a condition:

```hcl
[for item in collection : expression if condition]
```

**For Maps** - This can also be done working with maps:

```hcl
{for key, value in map : new_key => new_value}
```

### Basic Examples

**Example 1 – Simple Transformation**

```hcl
variable "apps" {
  default = ["Chrome", "Zoom", "Slack"]
}

output "install_policies" {
  value = [for app in var.apps : "Install ${app}"]
}
```

**Result:**

```hcl
["Install Chrome", "Install Zoom", "Install Slack"]
```

**Example 2 – Filtering**

```hcl
variable "os_list" {
  default = ["macOS", "iOS", "tvOS", "iPadOS"]
}

output "only_mac" {
  value = [for os in var.os_list : os if os == "macOS"]
}
```

**Result:**

```
["macOS"]
```

**Example 3 – For Maps**

```hcl
variable "departments" {
  default = {
    it         = 120
    marketing  = 40
    hr         = 25
  }
}

output "dept_groups" {
  value = {for dept, count in var.departments : dept => "${dept}-devices-${count}"}
}
```

**Result:**

```
{
  "it"        = "it-devices-120"
  "marketing" = "marketing-devices-40"
  "hr"        = "hr-devices-25"
}
```

### Jamf Pro Examples

**Example 1 – Policy Names from Apps**

```hcl
variable "apps" {
  default = ["Chrome", "Zoom", "Slack"]
}

output "jamf_policy_names" {
  value = [for app in var.apps : "Install ${app} on macOS"]
}
```

**Result:**

```
["Install Chrome on macOS", "Install Zoom on macOS", "Install Slack on macOS"]
```

**Example 2 – Groups by Department**

```hcl
variable "departments" {
  default = ["IT", "HR", "Marketing"]
}

output "jamf_groups" {
  value = [for dept in var.departments : "${dept} Managed Devices"]
}
```

**Result:**

```
["IT Managed Devices", "HR Managed Devices", "Marketing Managed Devices"]
```

**Example 3 – Filtering Only Apps That Start with "C"**

```hcl
variable "apps" {
  default = ["Chrome", "Zoom", "Slack", "Citrix"]
}

output "c_apps" {
  value = [for app in var.apps : app if startswith(app, "C")]
}
```

**Result:**

```
["Chrome", "Citrix"]
```

#### Exercise 1 – Transform

Given a variable of apps:

```hcl
apps = ["Safari", "Pages", "Numbers"]
```

Write a for expression that produces:

```
["Install Safari", "Install Pages", "Install Numbers"]
```

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "apps" {
  default = ["Safari", "Pages", "Numbers"]
}

output "app_output" {
  value = [for app in var.apps : "Install ${app}"]
}
```

</details>

---

#### Exercise 2 – Filter

From the list:

```hcl
os_list = ["macOS", "iOS", "tvOS", "watchOS"]
```

Write a for expression that returns only:

```
["iOS", "watchOS"]
```

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "os_list" {
  default = ["macOS", "iOS", "tvOS", "watchOS"]
}

output "os_output" {
  value = [for os in var.os_list : os if os == "iOS" || os == "watchOS"]
}
```

</details>

---

#### Exercise 3 – Maps

Given:

```hcl
departments = {
  it = 50
  hr = 20
}
```

Write a for expression that produces:

```
{
  it = "it-50-devices"
  hr = "hr-20-devices"
}
```

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "departments" {
  default = {
    it = 50
    hr = 20
  }
}

output "dept_devices" {
  value = {for dept, count in var.departments : dept => "${dept}-${count}-devices"}
}
```

</details>

---

#### Exercise 4 – Jamf Pro Group Names

Given a variable:

```hcl
departments = ["Engineering", "Design"]
```

Write a for expression that produces:

```
["Engineering Jamf Group", "Design Jamf Group"]
```

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "departments" {
  default = ["Engineering", "Design"]
}

output "dept_devices" {
  value = [for dept in departments : "${dept} Jamf Group"]
}
```

</details>

---

### Wrap-up

- **For expressions** let you transform and filter collections.

- Useful in Jamf Pro for **generating policy names, group names, or maps of departments to devices**.

- Syntax can return **lists** or **maps**.

- Filters let you include only the items you care about.

## Splat Expressions

A **splat expression** is a shorthand for accessing attributes across all elements of a list of resources or complex objects.

It’s especially useful when you have **multiple Jamf Pro resources** created by `count` or `for_each` and you want to **collect a list of their attributes** (like names, IDs, or enabled states).

### Syntax

The syntax for **splat expressions** is as follows:

```hcl
resource.list[*].attribute
```

Legacy Splat (older style, still works):

```hcl
resource.list.*.attribute
```

Both forms return a list of all `attribute` values from the resources.

### Basic Example

The following example shows how you can create multiple policy resources using the `count` variable and splat expressions:

```hcl
variable "apps" {
  default = ["Chrome", "Zoom", "Slack"]
}

resource "jamfpro_policy" "install_app" {
  count = length(var.apps)
  name  = "Install ${var.apps[count.index]}"

  # ... other policy configurations ...
}

# Output the name of each of the policies
output "policy_names" {
  value = jamfpro_policy.install_app[*].name
}
```

**Result:**

```
["Install Chrome", "Install Zoom", "Install Slack"]
```

### Splat Expressions with Attributes

You can splat any attribute that the resource exposes. For example, Jamf Pro policies might have:

- `id`

- `name`

- `enabled`

Using the example of the `install_app` policy created above:

```hcl
output "policy_ids" {
  value = jamfpro_policy.install_app[*].id
}
```

**Result:**

```
151 # This is just an example and the ID could be any number
```

This splat expression was used in the previous modules to directly access the ID of resources to use within other resources. Like Smart Groups to scope within policies.

### Nested Objects

If an attribute is itself an object, splats can go deeper. Using the example of the `install_app` policy created above:

```hcl
output "policy_names_enabled" {
  value = [for p in jamfpro_policy.install_app : "${p.name} - ${p.enabled}"]
}
```

**Result:**

```
"Install Chrome - True"
"Install Zoom - True"
"Install Slack - True"
```

### Filtering with Splat and For Expressions

You can combine splats with for to filter results.

```hcl
output "enabled_policies" {
  value = [for p in jamfpro_policy.install_app : p.name if p.enabled]
}
```

**Result:**

```
"Install Chrome"
"Install Zoom"
"Install Slack"
```

### Exercises

Now that you have has some examples of Splat Expressions, here are some exercises to develop that knowledge.

#### Exercise 1 - Names

Using the apps `["Safari", "Pages"]`, create two Jamf Pro policies (with count) and output a list of their names using a splat expression.

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "apps" {
  default = ["Safari", "Pages"]
}

resource "jamfpro_policy" "install_app" {
  count = length(var.apps)
  name  = "Install ${var.apps[count.index]}"
  enabled = true

  scope {
    all_computers = false
  }

  payloads {
    maintenance {
      recon                       = true
      reset_name                  = false
      install_all_cached_packages = false
      heal                        = false
      prebindings                 = false
      permissions                 = false
      byhost                      = false
      system_cache                = false
      user_cache                  = false
      verify                      = false
    }
  }

}

output "app_output" {
  value = [for p in jamfpro_policy.install_app : p.name]
}
```

</details>

---

#### Exercise 2 - IDs

Modify your policies so that you output only their IDs using splat expressions.

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
output "app_output" {
  value = [for p in jamfpro_policy.install_app : p.id]
}
```

</details>

---

#### Exercise 3 - Enabled Status

Create three Jamf Pro policies, two enabled and one disabled, and output a list of their enabled values (`true/false`) using a splat expression.

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "policies" {
  default = ["Policy 1", "Policy 2", "Policy 3"]
}

resource "jamfpro_policy" "policies" {
  count = length(var.policies)
  name  = "${var.policies[count.index]}"
  enabled = if var.policies[count.index] == "Policy 1" ? false : true

  scope {
    all_computers = false
  }

  payloads {
    maintenance {
      recon                       = true
      reset_name                  = false
      install_all_cached_packages = false
      heal                        = false
      prebindings                 = false
      permissions                 = false
      byhost                      = false
      system_cache                = false
      user_cache                  = false
      verify                      = false
    }
  }

}

output "enabled_output" {
  value = [for p in jamfpro_policy.policies : p.enabled]
}
```

</details>

---

#### Exercise 4 - Combined Output

Using a `for` with splat, output a list of strings in the format:

```
PolicyName: Status
```

For example (using any of the previous exercise policies):

```
["Install Chrome: true", "Install Zoom: false"]
```

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "policies" {
  default = ["Policy 1", "Policy 2", "Policy 3"]
}

resource "jamfpro_policy" "policies" {
  count = length(var.policies)
  name  = "${var.policies[count.index]}"
  enabled = if var.policies[count.index] == "Policy 1" ? false : true

  scope {
    all_computers = false
  }

  payloads {
    maintenance {
      recon                       = true
      reset_name                  = false
      install_all_cached_packages = false
      heal                        = false
      prebindings                 = false
      permissions                 = false
      byhost                      = false
      system_cache                = false
      user_cache                  = false
      verify                      = false
    }
  }

}

output "enabled_output" {
  value = [for p in jamfpro_policy.policies : "${p.name}: ${p.enabled}"]
}
```

</details>

---

### Wrap-up

- **Splat expressions** collect attributes across all resources created with **count** or **for_each**.

- Syntax: `resource[*].attribute`

- Useful in Jamf Pro for getting lists of **policy names, IDs, or enabled flags.**

- Can be combined with **for expressions** for filtering or formatting.

## Dynamic Blocks

A **dynamic block** allows you to dynamically generate nested configuration blocks inside a resource.

This is useful in Jamf Pro when:

- You want to **attach multiple scripts** to a policy.

- You want to **assign multiple packages** dynamically.

- You want to **build scope rules** from a list of departments or groups.

### Syntax

```hcl
dynamic "block_name" {
  for_each = var.collection
  content {
    # Arguments for each block
  }
}
```

- `block_name` = the nested block you want to generate (e.g., `script`, `scope`).

- `for_each` = the list or map you want to loop over.

- `content` = defines what goes inside each generated block.

### Simple Example - Scripts

```hcl
variable "jamf_scripts" {
  default = [
    { id = 201, priority = "Before" },
    { id = 202, priority = "After"  }
  ]
}

resource "jamfpro_policy" "run_scripts" {
  name    = "Run Dynamic Scripts"
  enabled = true

  scope {
    all_computers = false
  }

  payloads {
    dynamic "scripts" {
      for_each = var.jamf_scripts
      content {
        id       = jamf_scripts.value.id
        priority = jamf_scripts.value.priority
      }
    }
  }
}
```

This creates **one policy** with **two script blocks** attached.

### Another Example - Packages

```hcl
variable "packages" {
  default = [
    { id = 101, action = "Install" },
    { id = 102, action = "Cache" }
  ]
}

resource "jamfpro_policy" "install_apps" {
  name    = "Install Multiple Apps"
  enabled = true

  scope {
    all_computers = false
  }

  payloads {
    packages {
      distribution_point = "default"

      dynamic "package" {
        for_each = var.packages
        content {
          id     = package.value.id
          action = package.value.action
        }
      }
    }
  }
}
```

This creates **one policy** with **2 package objects** attached.

### Dynamic Printers

```hcl
variable "printers" {
  default = [
    { id = 301, name = "PrinterA", action = "install", make_default = true },
    { id = 302, name = "PrinterB", action = "install", make_default = false }
    { id = 303, name = "PrinterC", action = "install", make_default = false }
  ]
}

resource "jamfpro_policy" "add_printers" {
  name    = "Install Printers"
  enabled = true

  scope {
    all_computers = false
  }

  payloads {
    dynamic "printers" {
      for_each = var.printers
      content {
        id           = printers.value.id
        name         = printers.value.name
        action       = printers.value.action
        make_default = printers.value.make_default
      }
    }
  }
}
```

This will create **one policy** with **3 printer payloads**.

### Filtering with Dynamic Blocks

You can filter values before looping:

```hcl
variable "packages" {
  default = [
    { id = 501, action = "Install" },
    { id = 502, action = "Cache"   },
    { id = 503, action = "Install" }
  ]
}

resource "jamfpro_policy" "filtered_packages" {
  name    = "Install Only Packages"
  enabled = true

  scope {
    all_computers = false
  }

  payloads {
    packages {
      distribution_point = "default"

      dynamic "package" {
        for_each = [for p in var.packages : p if p.action == "Install"]
        content {
          id     = package.value.id
          action = package.value.action
        }
      }
    }
  }
}
```

This will create **one policy** with **3 packages** only if their action is `"Install"`

### Exercises

Now that you have seen some examples of dynamic blocks, let's do some exercises.

#### Exercise 1 - Packages

Given:

```hcl
packages = [
  { id = 601, action = "Install" },
  { id = 602, action = "Cache" }
]
```

Write a dynamic block to install/cache both packages inside `payloads -> packages`.

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "packages" {
  default = [
    { id = 601, action = "Install" },
    { id = 602, action = "Cache" }
  ]
}

resource "jamfpro_policy" "install_apps" {
  name    = "Install Multiple Apps"
  enabled = true

  scope {
    all_computers = false
  }

  payloads {
    packages {
      distribution_point = "default"

      dynamic "package" {
        for_each = var.packages
        content {
          id     = package.value.id
          action = package.value.action
        }
      }
    }
  }
}
```

</details>

---

#### Exercise 2 - Scripts

Given:

```hcl
scripts = [
  { id = 701, priority = "Before" },
  { id = 702, priority = "After" }
]
```

Write a dynamic block that adds both scripts.

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "scripts" {
  default = [
    { id = 701, priority = "Before" },
    { id = 702, priority = "After" }
  ]
}

resource "jamfpro_policy" "run_scripts" {
  name    = "Run Dynamic Scripts"
  enabled = true

  scope {
    all_computers = false
  }

  payloads {
    dynamic "scripts" {
      for_each = var.scripts
      content {
        id       = scripts.value.id
        priority = scripts.value.priority
      }
    }
  }
}
```

</details>

---

#### Exercise 3 - Printers

Given:

```hcl
printers = [
  { id = 801, name = "OfficePrinter", action = "install", make_default = true },
  { id = 802, name = "LabPrinter",   action = "install", make_default = false }
]
```

Write a dynamic block that installs both printers.

**Minimal Viable Answer:**

<details>

  <summary>Click to reveal</summary>

```hcl
variable "printers" {
  default = [
    { id = 801, name = "OfficePrinter", action = "install", make_default = true },
    { id = 802, name = "LabPrinter",   action = "install", make_default = false }
  ]
}

resource "jamfpro_policy" "add_printers" {
  name    = "Install Printers"
  enabled = true

  scope {
    all_computers = false
  }

  payloads {
    dynamic "printers" {
      for_each = var.printers
      content {
        id           = printers.value.id
        name         = printers.value.name
        action       = printers.value.action
        make_default = printers.value.make_default
      }
    }
  }
}
```

</details>

---

### Wrap-up

- **Dynamic blocks** help manage nested Jamf Pro resources (packages, scripts, printers, dock items, etc.).

- Use them when you’d otherwise repeat many similar blocks.

- Don’t use them for simple ID lists (like 'computer_group_ids') — just assign a list directly.

---

## ✅ Module 9 Summary

**🎯 Learning Objectives Achieved:**

- ✅ Mastered **Terraform data types** including primitives, collections, and structural types
- ✅ Created **dynamic string templates** with interpolation and conditional directives
- ✅ Implemented **conditional logic** using ternary operators and complex nested conditions
- ✅ Built **complex transformations** with for expressions and data manipulation
- ✅ Simplified **iterations** using splat expressions for efficient value extraction
- ✅ Generated **dynamic configurations** with dynamic blocks and programmatic resource creation
- ✅ Applied **mathematical and logical operators** for complex calculations and comparisons

**🔑 Key Concepts Covered:**

- **Data Types**: Primitive (string, number, bool), Collection (list, set, map), Structural (object, tuple)
- **String Templates**: Interpolation with `${}`, conditional directives with `%{if}`, iteration with `%{for}`
- **Operators**: Arithmetic (+, -, \*, /, %), Comparison (==, !=, <, >, <=, >=), Logical (&&, ||, !)
- **Conditional Expressions**: Ternary operators, nested conditionals, feature-based conditions
- **For Expressions**: List transformations, map transformations, filtering, complex nested operations
- **Splat Expressions**: Collection value extraction, nested attribute access, filtering patterns
- **Dynamic Blocks**: Programmatic block generation, conditional block creation, nested dynamic structures

**💼 Professional Skills Developed:**

- **Advanced Configuration Management**: Creating flexible, data-driven infrastructure configurations
- **Template Engineering**: Building dynamic templates with conditional logic and iteration
- **Data Transformation**: Converting and manipulating complex data structures efficiently
- **Pattern Recognition**: Identifying when to use different expression types for optimal solutions
- **Code Optimization**: Writing maintainable and performant Terraform configurations
- **Complex Logic Implementation**: Handling sophisticated business requirements in infrastructure code

**🏗️ Technical Achievements:**

- Built comprehensive multienvironment application with all expression types
- Implemented dynamic security groups with conditional rules based on environment
- Created complex data transformations with nested for expressions and filtering
- Developed template-based user data scripts with conditional feature installation
- Established patterns for cost calculation, resource scaling, and feature management
- Demonstrated advanced splat usage for efficient collection manipulation

**🧮 Advanced Expression Patterns Mastered:**

- **Conditional Resource Creation**: Using expressions to control resource deployment
- **Dynamic Configuration Generation**: Template-based configuration file creation
- **Complex Data Structures**: Multi-level nested objects with computed values
- **Cost Estimation**: Mathematical expressions for infrastructure cost calculations
- **Feature Flag Implementation**: Boolean logic for conditional feature enablement
- **Multi-Environment Scaling**: Expression-based scaling policies across environments

**🎨 Expression Best Practices:**

- **Readability**: Breaking complex expressions into manageable local values
- **Performance**: Using splat expressions for efficient collection operations
- **Maintainability**: Organizing expressions logically with clear naming conventions
- **Flexibility**: Creating reusable expression patterns for common operations
- **Documentation**: Using descriptive variable names and comments for complex logic

**➡️ Next Steps**: Ready to explore **Terraform importing**? Learn how to import existing configuration into your state file.

---

---

## 🔗 **Next Steps**

Ready to continue your Terraform journey? Proceed to the next module:

**➡️ [Module 6: State Import] (./module_06_state_import.md)**

Learn more about the import command and block.

---
