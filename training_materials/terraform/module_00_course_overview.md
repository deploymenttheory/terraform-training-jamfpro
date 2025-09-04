# 🚀 HashiCorp Terraform Associate Certification Training Program

## 📋 Module Overview

01. [Infrastructure as Code Concepts](./module_01_infrastructure_as_code_concepts.md)
02. [Configuration as Code Concepts](./module_02_configuration_as_code_concepts.md)
03. [HashiCorp Introduction](./module_03_hashicorp_introduction.md)  
04. [Terraform Basics](./module_04_terraform_basics.md)
05. [Configuration Management and Provisioners](./module_05_configuration_management_and_provisioners.md)
06. [Terraform Providers](./module_06_terraform_providers.md)
07. [Terraform Language and HashiCorp Language](./module_07_terraform_language_and_hashicorp_language.md)
08. [HCL Style Guide](./module_08_hcl_style_guide.md)
09. [Variables and Data](./module_09_variables_and_data.md)
10. [Meta Arguments](./module_10_meta_arguments.md)
11. [Expressions](./module_11_expressions.md)
12. [Terraform State](./module_12_terraform_state.md)
13. [TF Initialization](./module_13_tf_initialization.md)
14. [Writing and Modifying HCL](./module_14_writting_and_modifying_hcl.md)
15. [Plan and Apply](./module_15_plan_and_apply.md)
16. [Resource Drift Management](./module_16_resource_drift_management.md)
17. [State Import and Refresh Operations](./module_17_state_import_and_refresh_operations.md)
18. [Finding and Using Terraform Modules](./module_18_finding_and_using_terraform_modules.md)
19. [Standard Module Structure and Development](./module_19_standard_module_structure_and_development.md)
20. [Terraform Troubleshooting and Debugging](./module_20_terraform_troubleshooting_and_debugging.md)
21. [Publishing and Advanced Module Patterns](./module_21_publishing_and_advanced_module_patterns.md)
22. [Terraform Workflows](./module_22_terraform_workflows.md)
23. [Terraform Backends](./module_23_terraform_backends.md)
24. [Resources and Complex Types](./module_24_resources_and_complex_types.md)
25. [Built-in Functions](./module_25_built_in_functions.md)
26. [Terraform Cloud](./module_26_terraform_cloud.md)
27. [Terraform Cloud Workspaces](./module_27_terraform_cloud_workspaces.md)
28. [Sentinel and Policy as Code](./module_28_sentinel_policy_as_code.md)
29. [HashiCorp Vault Integration](./module_29_hashicorp_vault_integration.md)


## 📋 Course Prerequisites

### 🎯 Required Skills
Before starting this course, you should have:

- **🖥️ Basic Terminal/Command Line Skills**
  - Navigation (`cd`, `ls`, `pwd`)
  - File operations (`mkdir`, `rm`, `cp`, `mv`)
  - Text editing with `vscode`, or your preferred editor
  - Understanding of environment variables

- **☁️ Cloud Architecture Fundamentals**
  - Basic understanding of cloud concepts (compute, storage, networking)
  - Experience with at least one major cloud provider (AWS, Azure, or GCP)
  - Knowledge of basic infrastructure components (VMs, networks, security groups)

- **🛠️ Development Fundamentals**
  - Basic understanding of version control (Git)
  - Familiarity with JSON/YAML syntax
  - Basic scripting experience (Bash, PowerShell, or Python)

### 💻 Required Installations

#### Core Tools
```bash
# Terraform (Latest version)
# Visit: https://www.terraform.io/downloads.html
# Or use package manager:

# macOS
brew install terraform

# Windows (Chocolatey)
choco install terraform

# Linux (Ubuntu/Debian)
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
```

#### Code Editor (VS Code Required)
```bash
# Visual Studio Code - Download from https://code.visualstudio.com/
# Required Extensions:
code --install-extension HashiCorp.terraform
code --install-extension ms-vscode.vscode-json
code --install-extension redhat.vscode-yaml

# Optional but useful Extensions:
code --install-extension GitHub.copilot                   # AI assistance
code --install-extension ms-vscode.powershell             # PowerShell support
code --install-extension ms-vscode-remote.remote-ssh      # Remote development
code --install-extension eamodio.gitlens                  # Enhanced Git features
```

#### Cloud CLI Tools

**AWS CLI v2 Installation:**
Follow the official AWS documentation for your operating system:
- 📖 **Complete Installation Guide**: [AWS CLI Installation Documentation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

**Azure CLI Installation:**
Follow the official Microsoft documentation for your operating system:
- 🪟 **Windows**: [Install Azure CLI on Windows](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest&pivots=winget)
- 🐧 **Linux**: [Install Azure CLI on Linux](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?view=azure-cli-latest&pivots=apt)
- 🍎 **macOS**: [Install Azure CLI on macOS](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-macos?view=azure-cli-latest)

**Google Cloud SDK Installation:**
Follow the official Google Cloud documentation:
- 📖 **Complete Installation Guide**: [Google Cloud SDK Installation Documentation](https://cloud.google.com/sdk/docs/install)

**Verification Commands:**
```bash
# Verify installations
aws --version          # AWS CLI
az --version           # Azure CLI  
gcloud --version       # Google Cloud SDK
```

#### Additional Tools
```bash
# Git (Version Control)
sudo apt-get install git  # Linux
brew install git          # macOS

# jq (JSON processor - helpful for parsing outputs)
sudo apt-get install jq   # Linux
brew install jq           # macOS

# curl (API testing)
# Usually pre-installed on most systems
```

### 🔐 Account Setup Required

- **HashiCorp Account**: Sign up at [HashiCorp Cloud Platform](https://portal.cloud.hashicorp.com/)
- **Cloud Provider Account**: At least one of:
  - [AWS Free Tier Account](https://portal.aws.amazon.com/gp/aws/developer/registration/index.html?refid=em_127222&p=free&c=hp2&z=1&target=_blank)
  - [Azure Free Account](https://azure.microsoft.com/en-gb/pricing/purchase-options/azure-account)
  - [Google Cloud Platform Free Tier](https://cloud.google.com/free?hl=en)
- **GitHub Account**: [Sign up for GitHub](https://github.com/signup) for version control and collaboration

---

## 🎯 Course Overview

### 🏆 Learning Outcomes
By the end of this course, you will be able to:

#### **🎯 Core Terraform Skills**
- ✅ **Master Infrastructure as Code (IaC) concepts** and industry best practices
- ✅ **Write, plan, and apply Terraform configurations** with professional confidence
- ✅ **Work with providers, resources, and data sources** across multiple cloud platforms
- ✅ **Implement advanced Terraform features** including expressions, functions, and meta-arguments
- ✅ **Manage complex resource relationships** using dependencies and lifecycle rules

#### **🏗️ Advanced Infrastructure Management**
- ✅ **Master Terraform state management** including remote state, locking, and import operations
- ✅ **Implement Terraform backends** for secure, collaborative state storage
- ✅ **Perform state import and refresh operations** to adopt existing infrastructure
- ✅ **Troubleshoot and debug Terraform issues** using systematic approaches
- ✅ **Handle complex deployment scenarios** with conditional logic and dynamic blocks

#### **🔧 Professional Development Practices**
- ✅ **Create and publish reusable Terraform modules** following industry standards
- ✅ **Design modular infrastructure architectures** using composition patterns
- ✅ **Implement CI/CD pipelines** for automated Terraform deployments
- ✅ **Use Terraform Cloud and workspaces** for team collaboration and governance
- ✅ **Apply security best practices** including Sentinel policy-as-code

#### **🌐 Enterprise-Ready Skills**
- ✅ **Integrate HashiCorp Vault** for secrets management in infrastructure deployments
- ✅ **Implement multi-environment workflows** using workspace strategies
- ✅ **Design scalable module architectures** for large-scale infrastructure
- ✅ **Apply governance and compliance** through automated policy enforcement
- ✅ **Optimize Terraform performance** and manage complex dependencies

#### **🎓 Professional Certification Readiness**
- ✅ **Prepare for HashiCorp Certified: Terraform Associate** certification
- ✅ **Understand enterprise Terraform patterns** used in production environments
- ✅ **Demonstrate hands-on expertise** through comprehensive lab exercises
- ✅ **Apply real-world scenarios** including migration and adoption strategies


### 📊 Course Structure

This course follows the official HashiCorp Terraform Associate exam objectives and is structured as follows:

| Module | Topic | Duration | Difficulty | Hands-On Labs |
|--------|-------|----------|------------|---------------|
| 01 | 🏗️ Infrastructure as Code Concepts | 1.5 hours | 🟢 Beginner | 0 labs |
| 02 | 🔧 Configuration as Code Concepts | 1.5 hours | 🟢 Beginner | 0 lab |
| 03 | 🔷 HashiCorp Introduction | 1 hour | 🟢 Beginner | 1 lab |
| 04 | ⚡ Terraform Basics | 3 hours | 🟢 Beginner | 4 labs |
| 05 | 🛠️ Terraform Provisioners & Modern Infrastructure Configuration | 3 hours | 🟢 Beginner | 5 labs |
| 06 | 🔌 Terraform Providers | 2 hours | 🟢 Beginner| 2 labs |
| 07 | 📝 Terraform Language and HashiCorp Configuration Language | 1.5 hours | 🟢 Beginner | 2 labs |
| 08 | 🎨 HCL Style Guide | 1 hour | 🟢 Beginner | 1 lab |
| 09 | 📊 Variables and Data | 2.5 hours | 🟡 Intermediate | 3 labs |
| 10 | 🎯 Meta Arguments | 2 hours | 🟡 Intermediate | 3 labs | 
| 11 | 🔧 Expressions | 2 hours | 🟡 Intermediate | 3 labs |
| 12 | 📁 Terraform State | 2.5 hours | 🟡 Intermediate | 3 labs |
| 13 | 🚀 Initialization | 1.5 hours | 🟡 Intermediate | 2 labs |
| 14 | ✍️ Writing and Modifying HCL | 2 hours | 🟡 Intermediate | 3 labs |
| 15 | 🚀 Plan and Apply | 2.5 hours | 🟡 Intermediate | 4 labs |
| 16 | 🔄 Resource Drift Management | 1.5 hours | 🟡 Intermediate | 2 labs |
| 17 | 📥 State Import and Refresh Operations | 2 hours | 🔴 Advanced | 3 labs |
| 18 | 🔧 Terraform Troubleshooting and Debugging | 1.5 hours | 🔴 Advanced | 2 labs |
| 19 | 📦 Finding and Using Terraform Modules | 2 hours | 🟡 Intermediate | 3 labs |
| 20 | 🏗️ Standard Module Structure and Development | 3 hours | 🔴 Advanced | 4 labs |
| 21 | 📝 Publishing and Advanced Module Patterns | 2.5 hours | 🔴 Advanced | 3 labs |
| 22 | 🚀 Terraform Workflows | 2 hours | 🟡 Intermediate | 4 labs |
| 23 | 🚀 Terraform Backends | 3 hours | 🟡 Intermediate | 6 labs |
| 24 | 📝 Resources and Complex Types | 2.5 hours | 🟡 Intermediate | 4 labs |
| 25 | 🚀 Built-In Functions | 2 hours | 🔴 Advanced | 4 labs |
| 26 | 🚀 Terraform Cloud | 3 hours | 🟡 Intermediate | 4 labs |
| 27 | 📁 Terraform Cloud Workspaces | 2.5 hours | 🟡 Intermediate | 3 labs |
| 28 | 📝 Sentinel and Policy as Code | 3 hours | 🔴 Advanced | 4 labs |
| 29 | 🔒 HashiCorp Vault Integration | 2 hours | 🔴 Advanced | 2 labs |



**Total Course Time**: ~53 hours of content + ~84 hands-on labs

---

## 📚 Study Recommendations

### 🎯 Study Timeline by Experience Level

#### 🔰 **Beginner** (New to IaC, 60-80 hours recommended)

**Phase 1: Foundation (Weeks 1-3)**
- **Week 1**: Modules 1-4 (IaC concepts, Terraform basics, syntax fundamentals)
- **Week 2**: Modules 5-8 (Resources, data sources, expressions, functions)
- **Week 3**: Modules 9-12 (Variables, outputs, locals, meta-arguments)

**Phase 2: Intermediate Concepts (Weeks 4-6)**
- **Week 4**: Modules 13-16 (State management, import operations, troubleshooting)
- **Week 5**: Modules 17-20 (Modules, development patterns, workflows)
- **Week 6**: Modules 21-23 (Backends, remote state, collaboration)

**Phase 3: Advanced & Enterprise (Weeks 7-8)**
- **Week 7**: Modules 24-26 (Terraform Cloud, workspaces, Sentinel policies)
- **Week 8**: Module 27 + Review (Vault integration, comprehensive review)

- **Daily commitment**: 2-3 hours
- **Total duration**: 8 weeks

#### 🎓 **Intermediate** (Some IaC experience, 40-50 hours recommended)

**Phase 1: Core Mastery (Weeks 1-2)**
- **Week 1**: Modules 1-8 (Accelerated foundation + core concepts)
- **Week 2**: Modules 9-16 (Variables, state management, troubleshooting)

**Phase 2: Professional Skills (Weeks 3-4)**
- **Week 3**: Modules 17-23 (Modules, patterns, backends, collaboration)
- **Week 4**: Modules 24-27 (Cloud platforms, enterprise features)

**Phase 3: Mastery & Certification (Week 5)**
- **Week 5**: Hands-on projects, practice scenarios, certification prep

- **Daily commitment**: 2-2.5 hours
- **Total duration**: 5 weeks

#### 🚀 **Advanced** (Experienced with IaC/DevOps, 25-30 hours recommended)

**Phase 1: Terraform-Specific Focus (Week 1)**
- **Days 1-2**: Modules 1-8 (Review fundamentals, focus on Terraform specifics)
- **Days 3-4**: Modules 9-16 (Advanced features, state management)
- **Days 5-7**: Modules 17-20 (Module development, advanced patterns)

**Phase 2: Enterprise & Cloud Integration (Week 2)**
- **Days 1-3**: Modules 21-26 (Backends, Terraform Cloud, governance)
- **Days 4-5**: Module 27 + Advanced scenarios (Vault, complex integrations)
- **Days 6-7**: Certification preparation and advanced labs

- **Daily commitment**: 2-3 hours
- **Total duration**: 2 weeks

### 📋 **Recommended Study Approach**

#### **All Levels:**
1. **Complete each module's hands-on labs** - Essential for practical understanding
2. **Review knowledge assessments** - Reinforce learning and identify gaps
3. **Practice with real cloud accounts** - Apply concepts in actual environments
4. **Join study groups or forums** - Collaborate with other learners
5. **Build personal projects** - Create portfolio-worthy infrastructure examples

#### **Success Tips:**
- ✅ **Consistent daily practice** is more effective than marathon sessions
- ✅ **Focus on hands-on labs** - Theory + Practice = Mastery
- ✅ **Document your learning** - Keep notes and code examples
- ✅ **Practice troubleshooting** - Learn to debug and resolve issues
- ✅ **Prepare for certification** - Use official HashiCorp study guides

### 📖 Recommended Study Strategy

1. **🎬 Watch Module Content** - Understand concepts first
2. **💻 Complete Hands-On Labs** - Apply knowledge immediately  
3. **📝 Take Notes** - Document key commands and concepts
4. **🔄 Practice Regularly** - Repetition builds muscle memory
5. **🧪 Experiment** - Try variations of examples
6. **📊 Take Practice Exams** - Test your knowledge

### 📚 Additional Resources

#### Official Documentation
- [Terraform Documentation](https://www.terraform.io/docs)
- [HashiCorp Learn](https://learn.hashicorp.com/terraform)
- [HashiCorp Terraform Associate Questions](https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-questions)
- [Terraform Registry](https://registry.terraform.io/)
- [Terraform Associate (003) Tutorials](https://developer.hashicorp.com/terraform/tutorials/certification-associate-tutorials-003)

#### Community Resources
- [Terraform Best Practices](https://www.terraform-best-practices.com/)
- [Terraform AWS Examples](https://github.com/terraform-aws-modules)
- [r/Terraform Subreddit](https://www.reddit.com/r/Terraform/)
- [awesome TF](https://github.com/shuaibiyy/awesome-tf)
- [weeekly.TF](https://weekly.tf/)

---

#### 📜 HashiCorp Terraform Certification Prerequisites

**🎓 Recommended Background:**
Before diving into Terraform certification, you should have foundational cloud knowledge in the tool you're trying to manage :

- **☁️ Cloud Provider Experience**: AWS Solutions Architect Associate, Azure Administrator, or Google Cloud Associate
- **☁️ SaaS Provider Experience**: Microsoft 365 services [Certifications](https://learn.microsoft.com/en-us/credentials/browse/?credential_types=certification) , Jamf Pro [Certifications](https://www.jamf.com/training/)
- **💻 DevOps Fundamentals**: Understanding of automation, scripting, and infrastructure concepts
- **🛠️ System Administration**: Experience with Linux/Windows server management


#### 🎯 Terraform Certification Exam Details

**📋 Exam Overview:**
- **⏱️ Duration**: 60 minutes (90 minutes seat time including setup)
- **❓ Questions**: 57 questions total
- **📊 Passing Score**: ~70% (scaled scoring)
- **🎯 Target Score**: Aim for 80-85% on practice exams
- **🏢 Format**: Proctored online or test center (PSI)

**📝 Question Types:**
- **Multiple Choice** - Select one correct answer
- **Multiple Select** - Choose multiple correct answers  
- **Fill-in-the-Blank** - Type command names, flags, or terraform syntax

**⚠️ Important Notes:**
- No penalty for wrong answers - always answer every question
- Questions are short and practical (not theory-heavy)
- Focus on hands-on experience over memorization

#### 🎓 Certification Exam Domains

The Terraform Associate Certification covers **9 domains** (exact weighting not provided by HashiCorp):

1. **🏗️ Understand Infrastructure as Code (IaC) Concepts**
2. **🎯 Understand the Purpose of Terraform (vs other IaC)**
3. **⚡ Understand Terraform Basics**
4. **🔄 Use the Core Terraform Workflow**
5. **🔧 Interact with Terraform Modules**
6. **📦 Use Terraform Outside of Core Workflow**
7. **🏛️ Implement and Maintain State**
8. **📝 Read, Generate, and Modify Configuration**
9. **☁️ Understand Terraform Cloud Capabilities**

---

## 🗓️ Module Structure & Learning Objectives

### 📋 Learning Approach
Each module follows this proven structure:
- **🎯 Learning Objectives** - Clear goals for the module
- **📖 Concept Introduction** - Theory and background
- **💡 Pro Tips** - Expert insights and best practices  
- **💻 Hands-On Exercises** - Practical application
- **✅ Knowledge Check** - Validate understanding
- **🎯 Module Summary** - Key takeaways

---