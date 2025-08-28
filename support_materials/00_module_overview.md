# Terraform Training Plan - Jamf Pro Device Management

## Topic Breakdown & Durations

**Audience:** Team with deep Jamf Pro expertise, zero experience with Git, Terraform, CI/CD, Infrastructure as Code (IaC) + Configuration as Code (CaC)

### Module Time Summary

| Module | Instructor-Led Hours | Student-Led Hours | Total Hours |
|--------|---------------------|-------------------|-------------|
| Module 1: DevOps & Infrastructure as Code Foundations | 15.5 | 3 | 18.5 |
| HACK DAY 1: Device Management Innovation | - | 8 | 8 |
| Module 2: Jamf Pro Provider & Terraform Syntax | 5 | 8 | 13 |
| Module 3: Team Collaboration & State Management | 11 | 3.5 | 14.5 |
| Module 4: Jamf Resource Translation & Terraform Patterns | 36 | 18 | 54 |
| HACK DAY 2: Tenant Migrations | - | 8 | 8 |
| Module 5: TF Modules & Reusable Configurations | 18 | 10 | 28 |
| HACK DAY 3: Optimisation & Custom Solutions | - | 8 | 8 |
| **TOTAL** | **85.5** | **58.5** | **144** |

---

## Module 1: DevOps & Infrastructure as Code Foundations

**Learning Outcomes:** 
- Understand Infrastructure as Code principles and why configuration as code beats click ops
- Master VS Code as the primary development environment for infrastructure management
- Gain proficiency in Git fundamentals, GitOps workflows, and collaborative development practices
- Understand Terraform core concepts, architecture, and the provider ecosystem
- Learn HCL syntax and Terraform block types (provider, resource, data, variable, module, output)
- Understand the complete Terraform workflow (write, init, validate, plan, apply, destroy)
- Apply hands-on experience with Git and Terraform through practical exercises

### Day 1 (Instructor Led)

#### Topic 1.1: Infrastructure as Code principles - why config as code beats click ops *(2 hours)*

- Why config as code? - [Configuration as Code vs Click-and-Deploy](https://devcenter.upsun.com/posts/why-configuration-as-code-beats-click-and-deploy/)
- Architecture of the control plane - - TODO

#### Topic 1.2: VS Code fundamentals *(1.5 hours)*

- What is VS Code?
- [Visual Studio Code Made Easy For Beginners](https://www.youtube.com/watch?v=bfvq_kTbnd8&t=546s)
  - Complete steps from video
- [VS Code extensions tutorial](https://www.youtube.com/watch?v=q_Hq91-N9tU)
  - themes / icons
  - better comments
  - indent rainbow
  - codesnap
  - hashicorp terraform

#### Support Materials

- [Install VS Code](https://code.visualstudio.com/download)
- [Official VS Code documentation](https://code.visualstudio.com/docs)
- [Keyboard shortcuts reference](https://code.visualstudio.com/assets/docs/getstarted/tips-and-tricks/KeyboardReferenceSheet.png)
- [Tips and tricks](https://code.visualstudio.com/docs/getstarted/tips-and-tricks) 

#### Topic 1.3: Git fundamentals for infrastructure management *(2 hours)*

- [What is GitOps, How GitOps works and Why it's so useful](https://www.youtube.com/watch?v=f5EpcWp0THw&t=1s)
- [Git/GitHub roadmap](https://roadmap.sh/git-github)
- [DevOps master class](https://github.com/in28minutes/devops-master-class)
- Branching strategies with GitLab flow
- Release management with release-please

#### Hack Day Practice: Git + Terraform workflow mastery *(3 hours)*
- Complete: [Learn Git Branching](https://learngitbranching.js.org/)

### Day 2 (Instructor Led)

#### Topic 1.4: Terraform core concepts and architecture *(2 hours)*

- [Terraform overview](https://www.youtube.com/watch?v=l5k1ai_GBDE)
- Overview of modular and client-server architecture
- Terraform core concepts
- Overview of Providers and their purpose
- Overview of HCL Configuration files (templates)
- Overview of remote state management with Terraform Cloud

#### Topic 1.5: Provider ecosystem and version constraints *(2 hours)*

- Terraform registry (public vs. private)
- Provider versioning and alignment to Jamf Pro versions
- Useful providers within the ecosystem (local, random, time, http, axm)

#### Topic 1.6: Introduction to HCL syntax *(2 hours)*

- Terraform block types (provider, resource, data, variable, module, output, provisioners)

#### Topic 1.7: Terraform Workflow and state management *(2 hours)*

- Write
- Init: `terraform init`
- Validate: `terraform validate`
- Plan: `terraform plan`
- Apply: `terraform apply`
- Destroy: `terraform destroy`

### Module 1 Practice (Student-Led): Git + Terraform workflow mastery *(3 hours)*

This is a student-led practice session where the students will be given a series of tasks to complete.

#### Practice 1.1: VS Code intro videos *(0.5 hours)*

- Watch: [VS Code intro videos](https://code.visualstudio.com/docs/getstarted/introvideos)

#### Practice 1.2: Git commands and workflow mastery *(2 hours)*

- Complete: [Git/GitHub beginner roadmap](https://roadmap.sh/git-github?r=git-github-beginner) 
- Complete: [Oh My Git](https://ohmygit.org/)

#### Prerequisites:

- [Terraform CLI](https://developer.hashicorp.com/terraform) - local install
- [VS Code](https://code.visualstudio.com/)
- [VS Code Terraform extension](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)
- [Git](https://git-scm.com/)
- [GitHub account](https://github.com/)
**Instructor Led total:** 15.5 hours  
**Student-Led total:** 3 hours

### HACK DAY 1: Git Foundation and TF Basics

- Half day on Git
- Half day on Terraform basics

**Duration: 8 hours**


### Module 2: Jamf Pro Provider & Terraform Syntax

**Learning Outcomes:** Translate existing Jamf expertise into Terraform configurations

#### Topic 2.1: Provider configuration options and authentication (OAuth2/Basic) *(1 hour)*

- Load balancer settings, rate limiting (performance considerations)

#### Topic 2.2: Jamf resource syntax patterns in HCL *(1 hour)*

#### Topic 2.3: Resource dependencies and Terraform lifecycle *(1 hour)*

#### Topic 2.4: Data sources vs resources *(2 hours)*

#### Hands-on Practice: Convert existing Jamf configurations to Terraform *(8 hours)*

**Module Total: 13 hours**

### Module 3: Team Collaboration & State Management

**Learning Outcomes:** Move from individual Jamf admin work to collaborative infrastructure management

#### Topic 3.1: Remote state concepts with Terraform Cloud *(1 hour)*

#### Topic 3.2: Terraform Cloud workspaces and team permissions *(2 hours)*

#### Topic 3.3: Variable management and secrets handling with HashiVault *(2 hours)*

#### Topic 3.4: VCS integration workflows (Git + Terraform Cloud) *(2 hours)*

#### Topic 3.5: Workspace organization and environment separation *(2 hours)*

#### Topic 3.6: Collaboration patterns and approval workflows *(2 hours)*

#### Hands-on Practice: Team-based Jamf infrastructure management *(3.5 hours)*

**Module Total: 14.5 hours**


### Module 4: Jamf Resource Translation & Terraform Patterns

**Learning Outcomes:** Convert Jamf expertise into efficient Terraform configurations

#### Topic 4.1: Policy-as-code patterns (you know policies, learn the syntax) *(5 hours)*

#### Topic 4.2: Group management with Terraform (smart/static group syntax) *(4 hours)*

#### Topic 4.3: Prestage enrollment configurations in code *(4 hours)*

#### Topic 4.4: App deployment automation (VPP, self-service in Terraform) *(5 hours)*

#### Topic 4.5: Configuration profiles and scoping patterns *(4 hours)*

#### Topic 4.6: Resource relationships and dependencies *(6 hours)*

#### Topic 4.7: Advanced Terraform patterns for Jamf scenarios *(8 hours)*

- Using `for_each` for multiple device groups/policies (more resilient than `count`)
- Dynamic blocks for complex policy payloads
- Validation blocks for Jamf resource prerequisites
- Data transformation for device targeting and scoping

#### Topic 4.8: Level Up Your Terraform and best practices *(4 hours)*

- `for_each` vs `count` patterns for resilient configurations
- Dynamic blocks for complex nested configurations
- Validation with `precondition`/`postcondition` blocks
- Data transformation with `for` expressions
- State management with `moved`/`import` blocks
- Performance optimization techniques

#### Hands-on Practice: Recreate current Jamf setup in Terraform *(18 hours)*

**Module Total: 54 hours**

### HACK DAY 2: Tenant Migrations

**Advanced innovation leveraging full skill set and Go experience**

**Duration: 8 hours**


### Module 5: TF Modules & Reusable Configurations

**Learning Outcomes:** Advanced concept requiring good understanding of prior modules

#### Topic 5.1: Module concepts and structure for device management *(4 hours)*

#### Topic 5.2: Creating reusable policy and group modules *(5 hours)*

#### Topic 5.3: Module versioning and registry usage *(3 hours)*

#### Topic 5.4: Advanced HCL features (count, for_each, dynamic blocks) *(6 hours)*

#### Hands-on Practice: Building and using custom modules *(10 hours)*

**Module Total: 28 hours**

### HACK DAY 3: Optimisation & Custom Solutions

**Advanced innovation leveraging full skill set and Go experience**

**Duration: 8 hours**
---
