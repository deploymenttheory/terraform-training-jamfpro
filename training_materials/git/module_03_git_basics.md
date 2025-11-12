# ⚙️ Module 3: Git Basics

## 🎯 Learning Objectives

By the end of this section, you should be able to:

- Understand the core concepts of Git and how it manages file changes.
- Perform essential Git commands (clone, commit, branch, merge, push, pull).
- Explain how local and remote repositories interact.
- Apply these Git concepts to manage Terraform configurations for Jamf Pro.

---

## 🧩 1 What Is Git?

**Git** is a tool that tracks and manages changes to files over time.  
It’s the backbone of **version control** — a key practice for collaboration and reproducibility in modern IT and DevOps.

In this module, you’ll learn the basic Git commands and workflows that our team will use daily when managing Jamf Pro configurations with Terraform.

---

## 📁 2 The Git Repository Model

A **Git repository (repo)** is a special folder where Git tracks all file changes.  
There are two kinds of repositories:

| Type            | Description                                                              | Example                                     |
| --------------- | ------------------------------------------------------------------------ | ------------------------------------------- |
| **Local Repo**  | Exists on your computer. You make commits here.                          | `~/projects/jamf-terraform`                 |
| **Remote Repo** | Stored online (e.g., GitHub). You push and pull changes to keep in sync. | `https://github.com/org/jamf-terraform.git` |

---

## 🧠 3 The Three Git States

Git tracks files through three main stages:

| State                 | Description                                    | Command Example                       |
| --------------------- | ---------------------------------------------- | ------------------------------------- |
| **Working Directory** | Where you make changes to files.               | Edit `main.tf`                        |
| **Staging Area**      | Where you prepare changes for commit.          | `git add main.tf`                     |
| **Repository**        | Where committed changes are saved permanently. | `git commit -m "Add Jamf Pro policy"` |

### 🧩 Example Workflow

```bash
# 1. See what has changed
git status

# 2. Stage a change
git add main.tf

# 3. Commit it
git commit -m "feat(policy): add password policy"

# 4. Push to GitHub
git push origin feature/add-policy
```

> 💡 Think of it as a **pipeline** for code changes:  
> **Edit → Stage → Commit → Push**

---

## 🧱 4 Key Git Commands

| Command      | Description                         | Example                                               |
| ------------ | ----------------------------------- | ----------------------------------------------------- |
| `git init`   | Create a new Git repository         | `git init`                                            |
| `git clone`  | Download a repository from GitHub   | `git clone https://github.com/org/jamf-terraform.git` |
| `git status` | Check which files have changed      | `git status`                                          |
| `git add`    | Stage changes for commit            | `git add main.tf`                                     |
| `git commit` | Save a snapshot of staged changes   | `git commit -m "initial commit"`                      |
| `git log`    | Show commit history                 | `git log --oneline`                                   |
| `git push`   | Upload commits to GitHub            | `git push origin main`                                |
| `git pull`   | Download latest changes from GitHub | `git pull origin main`                                |
| `git diff`   | Show what changed between commits   | `git diff`                                            |

---

## 🌿 5 Branching and Merging

Branches allow multiple people to work on different tasks simultaneously without conflict.

### 🔧 Creating and Switching Branches

```bash
# Create a new branch
git checkout -b feature/add-policy

# Switch between branches
git checkout main
```

### 🔀 Merging Branches

When your feature is ready:

```bash
# Merge your branch into main
git checkout main
git merge feature/add-policy
```

> ✅ **Best Practice:** Always merge through a **Pull Request** in GitHub for review and visibility.

---

## ☁️ 6 Connecting to GitHub

### Cloning an Existing Repository

```bash
git clone https://github.com/org/jamf-terraform.git
cd jamf-terraform
```

### Setting a Remote for a Local Repository

```bash
git remote add origin https://github.com/org/jamf-terraform.git
git push -u origin main
```

Once connected, your **local repository** is synced with the **GitHub repository**, allowing team collaboration.

---

## 🧪 7 Hands-On Lab

### Lab 1: Initialize a Local Repo

1. Create a folder for your project:
   ```bash
   mkdir jamf-terraform && cd jamf-terraform
   ```
2. Initialize Git:
   ```bash
   git init
   ```
3. Create a simple Terraform file:
   ```bash
   echo '# Jamf Pro Terraform Config' > main.tf
   ```
4. Stage and commit it:
   ```bash
   git add main.tf
   git commit -m "initial commit with main.tf"
   ```

### Lab 2: Create and Merge a Branch

1. Create a branch for your new feature:
   ```bash
   git checkout -b feature/add-policy
   echo '# New Policy' >> main.tf
   git add main.tf
   git commit -m "feat(policy): add placeholder for policy"
   ```
2. Merge it back into main:
   ```bash
   git checkout main
   git merge feature/add-policy
   ```

### Lab 3: Connect to GitHub

1. Create a repo on GitHub named `jamf-terraform`.
2. Add the remote and push your code:
   ```bash
   git remote add origin https://github.com/your-org/jamf-terraform.git
   git push -u origin main
   ```

---

## 💡 8 Git in Terraform Context

When managing **Terraform for Jamf Pro**, Git helps:

- Track every configuration change to `.tf` files
- Keep state files (`.tfstate`) out of the repo
- Review and approve code through GitHub before deployment

**Example Workflow:**

1. Create a feature branch
2. Add or modify Terraform resources
3. Commit and push your changes
4. Open a Pull Request for review
5. Merge and run `terraform apply`

---

## 📋 9 Common Mistakes and How to Avoid Them

| Mistake                           | What Happens                      | How to Fix                               |
| --------------------------------- | --------------------------------- | ---------------------------------------- |
| Forgetting to pull before pushing | Conflicts with teammate changes   | `git pull origin main` before `git push` |
| Committing `.tfstate` files       | Sensitive state data gets exposed | Add to `.gitignore`                      |
| Large, single commits             | Hard to review changes            | Commit smaller, logical chunks           |
| Not writing descriptive messages  | Hard to trace history             | Use `feat:`, `fix:`, `chore:` prefixes   |

---

## 🧭 10 Summary

In this module, you learned:

- The core Git workflow: _Edit → Stage → Commit → Push_
- How branches enable collaboration
- How GitHub serves as the remote source of truth
- How to connect Git basics to Terraform workflows

> “Commit often, commit early, commit clearly.” — Git best practice

---
