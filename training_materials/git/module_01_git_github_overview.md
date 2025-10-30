# 🧠 Module 1: Git & GitHub Overview for Jamf Pro + Terraform

## 📋 Module Overview

This module will introduce version control with **Git** and **GitHub**, focusing on how we’ll use these tools to manage **Terraform configurations** for **Jamf Pro**.

By the end of this series of modules, you should be able to:

- Understand how Git works (repositories, commits, branches)
- Collaborate effectively using GitHub
- Store and manage Terraform code for Jamf Pro in version control
- Follow team workflows for pull requests and reviews

## 🧩 1. Why We’re Using Git and GitHub

Modern IT management relies on **Infrastructure as Code (IaC)** — managing configuration through code instead of manual UI clicks.

By using **Git** and **GitHub** with **Terraform** for Jamf Pro:

- Every configuration change is **tracked** and **auditable**
- We can **reproduce** or **roll back** any state
- Teams can **collaborate** safely without overwriting each other’s work
- We reduce human error and maintain consistency across environments

**Example:**  
Instead of manually creating a policy in Jamf Pro, we define it in Terraform code and store it in GitHub.  
When merged and applied, Terraform updates Jamf Pro automatically.

## ⚙️ 2. Git Basics

### Key Concepts

| Concept           | Description                                             | Example Command                       |
| ----------------- | ------------------------------------------------------- | ------------------------------------- |
| Repository (repo) | A repository similar to a folder or directory structure | `git init`                            |
| Clone             | Download a repo from GitHub                             | `git clone <url>`                     |
| Commit            | Record changes locally                                  | `git commit -m "message"`             |
| Branch            | Isolated workspace for changes                          | `git checkout -b feature/jamf-policy` |
| Merge             | Combine changes from branches                           | `git merge feature/jamf-policy`       |
| Push              | Upload local commits to GitHub                          | `git push origin main`                |
| Pull              | Download updates from GitHub                            | `git pull origin main`                |

### 🧠 How Git Works

1. **Working Directory:** where you edit files
2. **Staging Area:** where you prepare changes (`git add`)
3. **Repository:** where committed history is stored

```bash
# Typical workflow
git add main.tf
git commit -m "add new Jamf Pro policy module"
git push origin feature/add-policy
```

## 🧑‍🤝‍🧑 3. Working with GitHub

GitHub is where we store our code and collaborate as a team.

### 🔧 Common Tasks

- Create and clone repositories
- Add a `.gitignore` file to exclude unnecessary files

Example for Terraform:

```
.terraform/
*.tfstate
*.tfstate.backup
```

- **Branch strategy**

- `main` → stable production code
- `dev` → testing/staging branch (optional)
- `feature/*` → individual work branches

### 🧩 Pull Requests (PRs)

Pull Requests are how we propose and review changes.

1. Push your branch to GitHub
2. Open a PR to merge into main or dev
3. Request a teammate for review
4. Make any requested changes
5. Once approved, merge the PR

> [!Tip]
> 💬 Tip: PR reviews are your safety net — they help catch issues and share knowledge across the team.

### 🔒 Branch Protection

- No one should push directly to `main`
- All changes must go through PRs and approvals

## 🧱 4. Terraform + Git in Practice

### Topics

Example repository structure for Jamf Terraform:

```
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│   └── workload/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── README.md
```

### 🌱 Example Workflow

1. Create a new branch for a change (e.g., add new Jamf policy)

```bash
git checkout -b feature/add-jamf-policy
```

2. Edit Terraform files
3. Commit and push your work

```bash
git add .
git commit -m "feat(policy): add password compliance policy"
git push origin feature/add-jamf-policy
```

4. Open PR for review on GitHub
5. Request a teammate's review
6. Merge once approved
7. Run `terraform plan` and `terraform apply` to deploy

### ⚠️ Important

- **Never commit:**
  - `.tfstate` files
  - API credentials
  - Terraform Cloud workspace secrets
- Use **remote state** (e.g., S3 bucket or Terraform Cloud) instead.

## 🧪 5. Hands-On Lab (Separate modules)

### Exercise 1: Git/GitHub Basics

- Initialize a repo
- Create a Terraform file (e.g., `main.tf`)
- Add and commit changes
- Create a new branch, edit the file, and merge back

### Exercise 2: GitHub Collaboration

- Clone a shared GitHub repo
- Create a feature branch
- Make a PR
- Review a teammate’s PR
- Merge it after approval

### Exercise 3: Terraform Integration

- Create a new resource (e.g., Jamf policy via module)
- Commit and push changes
- Simulate peer review and approval workflow

## 🚦 6. Best Practices and Conventions

- **Branch naming:**
  - `feature/<name>` for new work
  - `fix/<name>` for bug fixes
  - `chore/<name>` for maintenance
- **Commit messages:**

Follow this convention:

```
type(scope): short description
```

Example:

```
feat(policy): add password complexity policy
```

- **Never commit:**

  - .tfstate files
  - API keys or credentials

- **Always:**

  - Work in branches
  - Open Pull Requests for all changes
  - Request peer reviews before merging

## 📚 7. Additional Resources

[Pro Git Book (Free)](https://git-scm.com/book/en/v2)

[GitHub Guides](https://docs.github.com/en)

[Terraform Docs](https://developer.hashicorp.com/terraform/docs)

[Jamf Pro Terraform Provider](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest)

## ✅ Summary

By using Git and GitHub with Terraform for Jamf Pro, we gain:

- Version control over configuration
- Collaboration through Pull Requests
- Safer, more auditable deployments
- The foundation for future automation (CI/CD, policy validation, etc.)

> “If it’s not in Git, it doesn’t exist.” — every DevOps engineer, ever.
