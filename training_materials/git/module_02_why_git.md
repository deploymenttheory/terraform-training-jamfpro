# 🧩 Module 2: Why We’re Using Git and GitHub

## 🎯 Learning Objectives

By the end of this section, you should be able to:

- Explain what Git and GitHub are, and why they’re valuable.
- Understand the importance of **version control** when managing infrastructure or configurations as code.
- Describe how Git and GitHub fit into our **Terraform + Jamf Pro** workflow.
- Recognize the business and operational benefits of using Git in our daily work.

---

## 🔍 1 What Is Git?

**Git** is a distributed version control system (VCS).  
It tracks changes to files over time — like a detailed “undo history” for your entire project.

### 🧠 Key Concept

Think of Git as a _time machine for your code_:

- Every change (commit) records **who** made it, **when**, and **what** was changed.
- You can **revert** to any earlier version if something breaks.
- Multiple people can work on the same files simultaneously without overwriting each other.

### 💻 Example

```bash
git init
git add main.tf
git commit -m "Initial Jamf Pro Terraform configuration"
```

This creates a new Git repository, tracks your Terraform file, and saves your first change.

---

## ☁️ 2 What Is GitHub?

**GitHub** is a cloud-based platform built on top of Git.  
It hosts repositories online so teams can collaborate.

With GitHub, you can:

- Store your Git repositories securely in the cloud.
- Share and review code through **Pull Requests**.
- Track issues, documentation, and project progress.
- Integrate with automation tools like **GitHub Actions**.

### 📘 Example

- You work locally on your laptop using Git.
- You **push** your commits to GitHub so others can see and review them.
- GitHub becomes the _single source of truth_ for your Terraform configuration.

---

## 🧱 3 Why We Use Git for Terraform + Jamf Pro

Our team manages Jamf Pro configurations through **Terraform** — which means everything from policies to profiles is written in code (`.tf` files).

Using Git provides us with structure, safety, and collaboration benefits.

### 🔒 1. Version Control and Traceability

Every configuration change is tracked.  
You can see:

- Who made the change
- When it was made
- What lines of code were added or removed

This makes auditing and compliance simple — especially in environments like Jamf Pro where security and consistency matter.

### 🤝 2. Collaboration and Peer Review

Multiple engineers can work on different configurations without conflicts.  
Git branching and **Pull Requests** allow team members to propose changes, get feedback, and review code before merging.

Example workflow:

1. Create a branch (`feature/add-password-policy`)
2. Edit the Terraform code for a new Jamf policy
3. Open a Pull Request
4. Get review and approval
5. Merge into `main` once verified

This ensures quality control before deployment.

### 🧩 3. Change Control and Rollback

If a Terraform deployment causes an issue, Git lets you:

- Compare the last known good configuration
- Revert to the previous commit
- Redeploy safely

No more guesswork about what changed or why something broke.

### ⚙️ 4. Automation and CI/CD Integration

Once our Terraform repositories are on GitHub, we can integrate:

- **GitHub Actions** for validation and testing (`terraform fmt`, `terraform plan`)
- Automated deployments after PR approval
- Notifications or approvals in Slack or Teams

This paves the way for a complete **Infrastructure as Code pipeline**.

### 🧾 5. Documentation and Knowledge Sharing

Each commit message, PR discussion, and code comment becomes part of our documented history.  
Future team members can easily see _why_ a configuration exists and _who_ changed it — no more tribal knowledge.

---

## 🌍 4 Git + Terraform + Jamf Pro in Practice

Here’s what the workflow looks like conceptually:

```
+-------------------+      +----------------+      +-----------------------+
| Engineer (Git)    | ---> | GitHub Repo    | ---> | Terraform Apply to    |
| - Write .tf files |      | - Pull Request |      | Jamf Pro Environment  |
| - Commit changes  |      | - Review/Merge |      | - Config Managed via  |
|                   |      |                |      |   Code & Versioning   |
+-------------------+      +----------------+      +-----------------------+
```

**Step-by-Step Example:**

1. Engineer writes new Jamf Pro policy in Terraform (`main.tf`).
2. Commits and pushes to GitHub.
3. Team reviews via Pull Request.
4. After merge, Terraform Cloud (or local) runs `terraform apply`.
5. Jamf Pro updates automatically — fully tracked and reproducible.

---

## 💡 5 Business Benefits

| Benefit            | Description                                              |
| ------------------ | -------------------------------------------------------- |
| **Accountability** | Every change has an author and timestamp.                |
| **Safety**         | Roll back easily if a configuration causes issues.       |
| **Speed**          | Multiple engineers can work concurrently.                |
| **Quality**        | Peer review ensures better, cleaner code.                |
| **Scalability**    | Configuration as Code scales easily across environments. |
| **Compliance**     | Version history helps with audits and change control.    |

---

## 🧭 6 Summary

Git and GitHub are the foundation of how we’ll manage Jamf Pro with Terraform.

They give us:

- A clear record of every configuration change
- Safe collaboration through branching and reviews
- The ability to automate deployments and rollbacks
- Confidence that our environment is reproducible, auditable, and maintainable

> “If it’s not in Git, it doesn’t exist.” — every DevOps engineer, ever.

---
