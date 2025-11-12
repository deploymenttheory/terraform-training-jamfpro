# 🧑‍🤝‍🧑 Module 4: Working with GitHub

## 🎯 Learning Objectives

By the end of this section, you should be able to:

- Understand what GitHub is and how it extends Git for collaboration.
- Create, clone, and manage repositories on GitHub.
- Use branches, Pull Requests (PRs), and code reviews effectively.
- Apply GitHub workflows to Terraform projects for Jamf Pro.

---

## ☁️ 1 What Is GitHub?

**GitHub** is a cloud-based service that hosts Git repositories and provides collaboration features.  
It allows teams to work together on code, track changes, review contributions, and integrate automation.

GitHub turns Git from a personal tool into a **team collaboration platform**.

### ✨ Why GitHub?

- Centralized location for all Terraform configuration code.
- Versioned, reviewed, and approved infrastructure changes.
- Easy rollback, auditing, and automation integration.
- Seamless integration with Terraform Cloud, CI/CD, and policy enforcement.

---

## 🧱 2 GitHub vs. Git

| Feature         | Git                          | GitHub                                   |
| --------------- | ---------------------------- | ---------------------------------------- |
| Version Control | ✅ Local commits and history | ✅ Cloud-hosted repository               |
| Collaboration   | ⚠️ Manual sharing required   | ✅ Pull Requests, code reviews, comments |
| Access Control  | Local only                   | ✅ Teams, roles, and permissions         |
| Automation      | Local scripts                | ✅ GitHub Actions CI/CD                  |
| Issue Tracking  | ❌                           | ✅ Built-in (Issues, Projects, Wikis)    |

> 💡 Git = the engine.  
> GitHub = the garage where we collaborate, store, and manage that engine.

---

## 📦 3 Repositories

A **repository (repo)** on GitHub contains:

- Your project’s files
- The full history of changes (commits)
- Branches for different development lines
- Issues, PRs, and discussions

### 🔧 Creating a Repository

1. Go to [GitHub.com](https://github.com)
2. Click **New Repository**
3. Set repository name (e.g., `jamf-terraform`)
4. Choose visibility:
   - 🔒 Private (recommended for internal use)
   - 🌍 Public (for open-source projects)
5. Initialise with a `.gitignore` file (Terraform template)

Once created, you can connect your local repository:

```bash
git remote add origin https://github.com/your-org/jamf-terraform.git
git push -u origin main
```

Or download the repository:

```bash
git clone https://github.com/your-org/jamf-terraform.git
```

---

## 🌿 4 Branching Strategy

Branches help isolate work so multiple people can safely make changes.

### 🪜 Common Strategy

| Branch      | Purpose                       |
| ----------- | ----------------------------- |
| `main`      | Stable, production-ready code |
| `dev`       | Integration/testing branch    |
| `feature/*` | New work or experiments       |
| `fix/*`     | Bug fixes                     |
| `chore/*`   | Maintenance or cleanup        |

Example of creating a new branch:

```bash
git checkout -b feature/add-password-policy
```

---

## 🔀 5 Pull Requests (PRs)

A **Pull Request** is how you propose changes from your branch to the main branch.  
It’s also the heart of collaboration and review in GitHub.

### 🔧 Creating a PR

1. Push your feature branch to GitHub:
   ```bash
   git push origin feature/add-policy
   ```
2. Open GitHub → Click **“Compare & Pull Request”**
3. Add a clear title and description:
   ```
   feat(policy): add password complexity policy
   ```
4. Request a reviewer (a teammate)
5. Wait for feedback and approvals
6. Merge once approved

---

## 👀 6 Code Reviews and Collaboration

Pull Requests allow others to:

- Comment on specific lines of code
- Suggest changes or improvements
- Approve or request revisions

### Review Guidelines

✅ Give constructive feedback  
✅ Explain why a change matters  
✅ Keep tone professional and supportive  
✅ Approve only after testing or validation

**Example Comment:**

> Consider renaming this variable to match the module naming convention.

---

## 🔒 7 Branch Protection Rules

To prevent mistakes, we protect critical branches (like `main`):

- Require Pull Requests before merging
- Require at least one reviewer approval
- Restrict direct pushes
- Optionally, require CI tests to pass before merge

Set up in GitHub:
**Settings → Branches → Branch Protection Rules**

---

## 📘 8 Using `.gitignore`

A `.gitignore` file tells Git which files to skip when committing.  
For Terraform projects, this prevents committing sensitive or unnecessary files.

Example:

```gitignore
# Terraform
*.tfstate
*.tfstate.backup
.terraform/
crash.log
override.tf
terraform.tfvars
```

> ⚠️ Never commit `.tfstate` files — they may contain sensitive data!

---

## ⚙️ 9 GitHub Workflow for Terraform + Jamf Pro

Here’s the typical process we’ll use:

1. Clone the repository
2. Create a feature branch
3. Make Terraform changes
4. Commit and push
5. Open a Pull Request
6. Review, approve, and merge
7. Apply changes via Terraform

### 🧩 Example Flow

```
Engineer → Branch → Commit → Push → Pull Request → Review → Merge → terraform apply
```

This ensures every Jamf Pro configuration change is reviewed, approved, and documented.

---

## 🤖 10 Automation with GitHub Actions (Intro/Optional)

GitHub Actions let us automate Terraform tasks.

### Example: Terraform Workflow

```yaml
name: Terraform Validate

on: [pull_request]

jobs:
  terraform:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: hashicorp/setup-terraform@v3
      - run: terraform fmt -check
      - run: terraform validate
```

This automatically checks every Pull Request for Terraform formatting and syntax errors.

> 🚀 In future modules, we could expand this to full **CI/CD pipelines** for Jamf Pro deployments.

---

## 🧪 11 Hands-On Labs

### Lab 1: Create and Clone a Repository

1. Create a new GitHub repo named `jamf-terraform`.
2. Clone it locally:
   ```bash
   git clone https://github.com/your-org/jamf-terraform.git
   ```

### Lab 2: Work with Branches and PRs

1. Create a branch for a new Jamf policy:
   ```bash
   git checkout -b feature/add-policy
   ```
2. Add a new Terraform file:
   ```bash
   echo 'resource "jamfpro_policy" "password_policy" {}' > policy.tf
   ```
3. Commit and push:
   ```bash
   git add policy.tf
   git commit -m "feat(policy): add password policy"
   git push origin feature/add-policy
   ```
4. Open a Pull Request on GitHub.

### Lab 3: Review and Merge

- Review a teammate’s PR.
- Approve or request changes.
- Merge into `main` after review.

---

## 📋 12 Best Practices

| Practice                      | Description                             |
| ----------------------------- | --------------------------------------- |
| **Use branches**              | Never work directly on `main`.          |
| **Small PRs**                 | Easier to review and merge safely.      |
| **Descriptive commits**       | Use `feat:`, `fix:`, `chore:` prefixes. |
| **Review everything**         | At least one teammate must approve.     |
| **Protect main branch**       | Enforce rules in GitHub.                |
| **Keep `.gitignore` updated** | Avoid committing state or secrets.      |

---

## 🧭 13 Summary

In this module, you learned:

- How GitHub enhances collaboration with Git.
- The purpose and process of Pull Requests.
- How to manage branches, reviews, and protected workflows.
- How GitHub supports Terraform automation for Jamf Pro.

> “Collaboration is the heart of version control. GitHub makes it possible.”

---
