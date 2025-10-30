# 🧠 Hackday: Jamf Pro → Terraform Migration

**Objectives and Tasks**

---

## 🎯 Objective

The goal of this Hackday is to **migrate an existing Jamf Pro environment into Terraform** using the **Jamf Pro Terraform Provider**.

Participants will demonstrate their understanding of:

- Terraform as **configuration as code (CaC)** and **documentation**.
- Importing existing Jamf resources into Terraform configuration using both **`import` blocks** and/or **the CLI**.
- Structuring scalable, readable, and reusable Terraform configurations.

At the end, your Terraform project should represent a **representative and well-structured mirror** of the target Jamf Pro environment — and when you run `terraform plan`, **no differences should appear.**

---

## 🧩 Requirements

Each team or individual will receive only:

- A **Jamf Pro instance**
- Basic **Provider Configuration** (provider.tf)

No other documentation, templates, or starter code will be provided.
Your Terraform configurations, structure, and approach are entirely up to you.

Each team or individual will require the following:

- Development Environment (VS Code, Terraform and Git)
- A GitHub Account
- Completed the GitHub setup steps below

**You will need to:**

1. Create a local user account in your Jamf Pro tenant.
2. Generate API credentials (API Role and API Client) for your Terraform provider configuration.
3. Create a `terraform.tfvars` file that holds the credentials for your provider
4. Use the Jamf Pro Terraform Provider to:
   - Import existing resources.
   - Build Terraform files that accurately describe your environment.

---

## GitHub Setup

In order to start this Hack, you will need a copy of this repo, to ensure that you can contribute your work as a team.

Follow these instructions:

1. Sign in to your GitHub account
2. One member of the team should fork this repo
3. Each member of the team should clone this repo
4. Each member of the team should create a branch of the repo (use the format `feat-initials`)
5. Each member should commit to their branch
6. Once confident in the work that has been completed, a Pull Request should be opened to contribute all the work into main
7. One member of the team should then apply this code to the Jamf Instance / Or this will be applied by a Terraform Workspace

---

## Good to know

Things that you will need to know for this hack day are the following:

- You might want to create a variable for your team name prefix to make things easier to manage in terms on naming standards.
- When running your `terraform plan`, you may see some changes/diffs for resources such as config profile or policies, where in terraform, there are attributes that don't exist in Jamf Pro. For these, you can ignore, as long as you are confident that the configuration is exactly the same in Terraform as it is in the UI.
- There may be some times when copying all the names and IDs out of Jamf will become tiresome. Try and think of ways to make that easier.

## 🧰 Tasks

| #   | Task                         | Description                                                                                       |
| --- | ---------------------------- | ------------------------------------------------------------------------------------------------- |
| 1   | **Provider Setup**           | Configure the Jamf Pro provider with your API credentials. Ensure authentication works correctly. |
| 2   | **API Roles & Clients**      | Import and manage at least one API Role and API Client via Terraform.                             |
| 3   | **Resource Migration**       | Import and define the following resource types:                                                   |
|     | • **Categories (TBC)**       | Import all the categories into Terraform.                                                         |
|     | • **Scripts (TBC)**          | Import and manage the scripts using Terraform.                                                    |
|     | • **Smart & Static Groups**  | Import and define both types.                                                                     |
|     | • **Configuration Profiles** | Import and manage configuration profiles.                                                         |
|     | • **Policies (TBC)**         | Policies should use scripts, groups, and categories; relationships must be preserved.             |
|     | • **Dock Items (TBC)**       | Import and define dock items for relationships in Policies                                        |
|     | • **Departments (TBC)**      | Import and define Departments for relationships in other resources                                |
|     | • **Mac Apps**               | Import and represent Mac Apps appropriately.                                                      |
| 4   | **Data Sources / Outputs**   | Add Terraform data sources and outputs for “reporting” or summarizing environment details.        |
