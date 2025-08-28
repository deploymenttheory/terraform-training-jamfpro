# Terraform Training Plan - Jamf Pro Device Management (Multiple Timeline Options)

## Realistic Topic Breakdown & Durations (For Jamf Experts New to DevOps/IaC)

**Audience:** Team with deep Jamf Pro expertise, zero experience with Git, Terraform, CI/CD, Infrastructure as Code

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

### Module 1: DevOps & Infrastructure as Code Foundations
**Learning Outcomes:** Master the mindset shift from GUI-based Jamf management to code-based infrastructure
#### **Instructor Led**
#### **Topic 1.1:** Infrastructure as Code principles - why config as code beats click ops *(2 hours)*
  - TODO - https://devcenter.upsun.com/posts/why-configuration-as-code-beats-click-and-deploy/
  - https://code.visualstudio.com/docs/getstarted/tips-and-tricks?originUrl=%2Fdocs%2Fgetstarted%2Ftips-and-tricks 
#### **Topic 1.2:** Git fundamentals for infrastructure management *(3.5 hours)*
 - What is GitOps, How GitOps works and Why it's so useful: https://www.youtube.com/watch?v=f5EpcWp0THw&t=1s
 - TODO - https://roadmap.sh/git-github
 - TODO - https://github.com/in28minutes/devops-master-class
 - What is vscode?
 - https://code.visualstudio.com/docs
#### **Topic 1.3:** Version control workflows and branching strategies *(2 hours)*
 - concepts
 - google release please and gitlab flow
#### **Topic 1.4:** Terraform core concepts and architecture *(2 hours)*
 - overview of modular and client-server architecture
 - Terraform core  
 - overview of Providers and their purpose
 - overview of HCL Configuration files (templates)
 - Overview of remote state management with tfc
#### **Topic 1.5:** Provider ecosystem and version constraints *(2 hours)*
 - terraform registry (public vs. private)
 - provider versioning and alignment to jamf pro versions
 - useful providers within the ecosystem (local, random, time, http, axm)
#### **Topic 1.6:** Introduction to HCL syntax *(2 hours)*
 - terraform block types (provider, resource, data, variable,module, output, provisioners)
#### **Topic 1.7:** Terraform Workflow and state management *(2 hours)*
  - write
  - init `terraform init`
  - plan `terraform plan`
  - apply `terraform apply`
  - destroy `terraform destroy`
  - validate `terraform validate`
  - show
  - state
#### **Student-Led Hands-on Practice:** Git + Terraform workflow mastery *(3 hours)*
  #### **Practice 1.1:** VS Code intro videos *(0.5 hours)*
    - Watch these - https://code.visualstudio.com/docs/getstarted/introvideos 
  #### **Practice 1.2:** Git commands and workflow mastery *(2 hours)*
    - Complete this - https://roadmap.sh/git-github?r=git-github-beginner 
#### **Pre Reqs:**
  - local install of terraform cli - https://developer.hashicorp.com/terraform
  - vscode - https://code.visualstudio.com/
  - vscode terraform extension - https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform
  - git - https://git-scm.com/
  - github account - https://github.com/
#### **Instructor Led total:** 15.5 hours
#### **Student-Led total:** 3 hours

### **HACK DAY 1: Git Foundation and TF Basics**
- half day on git
- half day on tf basics
#### **Duration: 8 hours**


### Module 2: Jamf Pro Provider & Terraform Syntax
**Learning Outcomes:** Translate existing Jamf expertise into Terraform configurations
#### **Topic 2.1:** Provider configuration options and authentication (OAuth2/Basic) *(1 hours)*
  - Load balancer settings, rate limiting (performance considerations)
#### **Topic 2.2:** Jamf resource syntax patterns in HCL *(1 hours)*
#### **Topic 2.3:** Resource dependencies and Terraform lifecycle *(1 hours)*
#### **Topic 2.4:** Data sources vs resources *(2 hours)*
#### **Hands-on Practice:** Convert existing Jamf configurations to Terraform *(8 hours)*
#### **Module Total: 13 hours**

### Module 3: Team Collaboration & State Management
**Learning Outcomes:** Move from individual Jamf admin work to collaborative infrastructure management
#### **Topic 3.1:** Remote state concepts  *(1 hours)*
#### **Topic 3.2:** Terraform Cloud workspaces and team permissions *(2 hours)*
#### **Topic 3.3:** Variable management and secrets handling with hashivault *(2 hours)*
#### **Topic 3.4:** VCS integration workflows (Git + Terraform Cloud) *(2 hours)*
#### **Topic 3.5:** Workspace organization and environment separation *(2 hours)*
#### **Topic 3.6:** Collaboration patterns and approval workflows *(2 hours)*
#### **Hands-on Practice:** Team-based Jamf infrastructure management *(3.5 hours)*
#### **Module Total: 14.5 hours**


### Module 4: Jamf Resource Translation & Terraform Patterns
**Learning Outcomes:** Convert Jamf expertise into efficient Terraform configurations
#### **Topic 4.1:** Policy-as-code patterns (you know policies, learn the syntax) *(5 hours)*
#### **Topic 4.2:** Group management with Terraform (smart/static group syntax) *(4 hours)*
#### **Topic 4.3:** Prestage enrollment configurations in code *(4 hours)*
#### **Topic 4.4:** App deployment automation (VPP, self-service in Terraform) *(5 hours)*
#### **Topic 4.5:** Configuration profiles and scoping patterns *(4 hours)*
#### **Topic 4.6:** Resource relationships and dependencies *(6 hours)*
#### **Topic 4.7:** Advanced Terraform patterns for Jamf scenarios *(8 hours)*
  - Using for_each for multiple device groups/policies (more resilient than count)
  - Dynamic blocks for complex policy payloads
  - Validation blocks for Jamf resource prerequisites
  - Data transformation for device targeting and scoping
#### **Topic 4.8:** Level Up Your Terraform and best practices *(4 hours)*
  - for_each vs count patterns for resilient configurations
  - Dynamic blocks for complex nested configurations
  - Validation with precondition/postcondition blocks
  - Data transformation with for expressions
  - State management with moved/import blocks
  - Performance optimization techniques
#### **Hands-on Practice:** Recreate current Jamf setup in Terraform *(18 hours)*
#### **Module Total: 54 hours**

### **HACK DAY 2: Tenant Migrations**  
**Advanced innovation leveraging full skill set and Go experience**
#### **Duration: 8 hours**


### Module 5: TF Modules & Reusable Configurations
**Learning Outcomes:** Advanced concept requiring good understanding of prior modules
#### **Topic 5.1:** Module concepts and structure for device management *(4 hours)*
#### **Topic 5.2:** Creating reusable policy and group modules *(5 hours)*
#### **Topic 5.3:** Module versioning and registry usage *(3 hours)*
#### **Topic 5.4:** Advanced HCL features (count, for_each, dynamic blocks) *(6 hours)*
#### **Hands-on Practice:** Building and using custom modules *(10 hours)*
#### **Module Total: 28 hours**

### **HACK DAY 3: Optimisation & Custom Solutions**  
**Advanced innovation leveraging full skill set and Go experience**
#### **Duration: 8 hours**
---

## Detailed Daily Schedules

### Option 1: Intensive Bootcamp Schedule (7 Days Total)

## Sample Weekly Schedule (Option C: Daily Learning - Most Realistic Choice)

### Daily Structure (2 hours/day):
#### **Hour 1:** New concept introduction and theory (instructor-led or recorded)
#### **Hour 2:** Hands-on practice and lab work (student-led with support)
#### **Weekly:** Office hours Q&A session and progress review *(1 hour/week)*

### Weekly Progression Example (32 weeks total):
#### **Weeks 1-3:** Module 1 (DevOps & IaC Foundations) - *23 hours*
#### **Weeks 4-7:** Module 2 (Jamf Provider & Terraform Syntax) - *32 hours*
#### **Weeks 8-14:** Module 3 (Team Collaboration & State Management) - *52 hours*
#### **Week 15:** Hack Day 1 (Device Management Innovation) - *8 hours*
#### **Weeks 16-22:** Module 4 (Jamf Resource Translation) - *62 hours*  
#### **Weeks 23-27:** Module 5 (Modules & Reusable Components) - *50 hours*
#### **Weeks 28-32:** Module 6 (CI/CD & Pipeline Automation) - *85 hours*
#### **Week 32:** Hack Day 2 (Integration & Custom Solutions) - *8 hours*

*This provides natural break points and allows for concept absorption between modules. Office hours each week provide support for struggling concepts.*



---

## Delivery Timeline Options

Now that we know the realistic scope, here are different ways to deliver the 200 hours:

### Option A: Intensive Immersive (5 Weeks Full-Time)
#### **Schedule:** 8 hours/day × 25 days = 200 hours
#### **Calendar Duration:** 5 consecutive weeks
#### **Team Availability:** 100% dedicated to training
#### **Best For:** New team members, major skill transition, dedicated training budget

### Option B: Half-Time Intensive (10 Weeks)  
#### **Schedule:** 4 hours/day × 50 days = 200 hours
#### **Calendar Duration:** 10 weeks (2.5 months)
#### **Team Availability:** 50% training, 50% regular work
#### **Best For:** Teams that can reduce current workload significantly

### Option C: Daily Learning (20 Weeks)
#### **Schedule:** 2 hours/day × 100 days = 200 hours  
#### **Calendar Duration:** 20 weeks (5 months)
#### **Team Availability:** 25% training, 75% regular work
#### **Best For:** Teams with ongoing responsibilities, steady learning pace

### Option D: Part-Time Extended (40 Weeks)
#### **Schedule:** 1 hour/day × 200 days = 200 hours
#### **Calendar Duration:** 40 weeks (10 months)  
#### **Team Availability:** 12.5% training, 87.5% regular work
#### **Best For:** Teams with heavy current workloads, very gradual transition

### Option E: Sprint Hybrid (3-4 Months)
#### **Schedule:** 2-week intensive sprints alternating with 1-week practice periods
#### **Pattern:** 2 weeks @ 6hrs/day (60h) → 1 week practice → repeat
#### **Calendar Duration:** 14-16 weeks (3.5-4 months)
#### **Best For:** Agile teams, iterative learning with project integration

---

## Recommended Delivery Schedules by Team Situation

### **For Teams with High Urgency + Dedicated Time → Option A (5 Weeks Full-Time)**
*Complete transformation in shortest calendar time*

### **For Teams Balancing Current Work → Option C (20 Weeks Daily)**  
*Sustainable learning pace with 2 hours daily commitment*

### **For Teams with Continuous Operations → Option D (40 Weeks Part-Time)**
*Minimal disruption to current responsibilities*

### **For Agile/Development Teams → Option E (Sprint Hybrid)**
*Aligns with existing development methodologies*



---

## Core Learning Objectives (All Options)

By completion, participants will be able to:
1. Design and implement Apple device management infrastructure as code using Terraform and Jamf Pro
2. Manage Terraform Cloud state effectively for team collaboration
3. Create reusable modules for common Jamf Pro configurations (policies, groups, apps)
4. Implement proper security practices for API authentication and device management
5. Set up CI/CD pipelines for automated Jamf Pro configuration deployment
6. Troubleshoot and debug Terraform configurations with Jamf Pro provider specifics
7. Collaborate effectively using Terraform Cloud workspaces for device management workflows
8. Leverage Go skills for custom tooling and advanced Terraform provider development

---

## Detailed Curriculum

### Module 1: DevOps & Infrastructure as Code Foundations
**Learning Goals:** Master the mindset shift from GUI-based Jamf management to code-based infrastructure


#### Hands-on Labs:
#### **Lab 2.1:** Install Terraform and configure jamfpro provider (OAuth2 + Basic Auth methods)
#### **Lab 2.2:** Provider configuration deep dive (all 20+ settings, rate limiting, SDK logging)
#### **Lab 2.3:** Create jamfpro_account with custom privileges and site access
#### **Lab 2.4:** Build jamfpro_static_computer_group and jamfpro_account_group resources
#### **Lab 2.5:** Resource lifecycle management (plan, apply, destroy) with dependency handling
#### **Lab 2.6:** Load balancer lock configuration and troubleshooting common provider issues

**Time Allocation:**
- Intensive: 1 day
- Standard: 3-4 days  
- Extended: 1 week
- Sprint: 1 week (Sprint 1)

### Module 2: Terraform Cloud State & Jamf Pro Core Resources
**Learning Goals:** Master Terraform Cloud workspaces, variables, outputs, and core Jamf Pro configurations

#### Topics Covered:
- Terraform Cloud setup and workspace management
- Remote state with Terraform Cloud (no need for S3/backend config)
- State locking and team collaboration
- Variables and locals for Jamf Pro configurations
- Outputs and data sources for Jamf Pro resources
- Core Jamf Pro resources: policies, groups, accounts, sites
- Jamf Pro API authentication patterns

#### Hands-on Labs:
#### **Lab 3.1:** Configure Terraform Cloud workspace with jamfpro provider variables
#### **Lab 3.2:** Implement variable-driven jamfpro_policy configurations
#### **Lab 3.3:** Create jamfpro_smart_computer_group with complex criteria and search types
#### **Lab 3.4:** Multi-resource deployments (policies + groups + accounts) with proper dependencies
#### **Lab 3.5:** Team collaboration: shared workspaces for device management workflows

**Time Allocation:**
- Intensive: 1 day
- Standard: 4-5 days
- Extended: 1.5 weeks
- Sprint: 1 week (Sprint 2)

### **HACK DAY 1: Device Management Innovation**
**Focus:** Creative solutions for common Apple device management challenges
#### **Challenge:** Design automated device onboarding workflows
#### **Tools:** Jamf Pro provider + creativity
#### **Outcome:** Novel approaches to device enrollment, app deployment, or user provisioning

### Module 3: Advanced Jamf Pro Configurations & Modules
**Learning Goals:** Build reusable, maintainable device management code with modules

#### Topics Covered:
- Module creation for Jamf Pro configurations
- Advanced HCL features (functions, expressions)
- Conditional resource creation for device policies
- Dynamic blocks for complex configurations
- App deployment automation
- Configuration profile management
- Security and compliance automation

#### Hands-on Labs:
#### **Lab 5.1:** Create reusable jamfpro_policy module with variable payloads (packages, scripts, maintenance)
#### **Lab 5.2:** Build jamfpro_computer_prestage_enrollment module with conditional configurations
#### **Lab 5.3:** Develop jamfpro_mobile_device_application module for app catalog automation
#### **Lab 5.4:** Comprehensive device onboarding module (prestage + groups + policies + profiles)
#### **Lab 5.5:** Advanced patterns lab: for_each-based policy deployment with dynamic payloads
#### **Lab 5.6:** Module versioning and registry publishing for team reuse

**Time Allocation:**
- Intensive: 1.5 days
- Standard: 5-6 days
- Extended: 2 weeks
- Sprint: 1 week (Sprint 3)

### Module 4: Production Practices, CI/CD & Advanced Jamf Pro
**Learning Goals:** Implement enterprise-ready practices and automation for device management

#### Topics Covered:
- Terraform Cloud workspace strategies for multiple environments (dev/staging/prod)
- Security best practices for Jamf Pro API management
- CI/CD pipeline integration for device management automation
- Advanced Jamf Pro features: smart groups, advanced policies, patch management
- Drift detection and remediation for device configurations
- Team collaboration workflows with device management responsibilities
- Troubleshooting Jamf Pro provider specific issues
#### **Go Integration:** Building custom tools and provider extensions

#### Hands-on Labs:
#### **Lab 6.1:** Multi-environment Jamf Pro instances (dev/staging/prod) with Terraform Cloud
#### **Lab 6.2:** Secure OAuth2 credential management across environments
#### **Lab 6.3:** GitHub Actions pipeline for jamfpro_policy and jamfpro_configuration_profile deployment
#### **Lab 6.4:** Advanced compliance automation (jamfpro_restricted_software, jamfpro_webhook integration)
#### **Lab 6.5:** Production deployment strategies: blue-green device policy rollouts
#### **Lab 6.6:** Monitoring and alerting for Jamf Pro infrastructure changes

**Time Allocation:**
- Intensive: 1.5 days
- Standard: 6-8 days
- Extended: 1.5 weeks
- Sprint: 1 week (Sprint 4)

### **HACK DAY 2: Integration & Custom Solutions**
**Focus:** Advanced integrations and custom tooling development
#### **Challenge:** Build integrations between Jamf Pro and other systems or create custom Go-based tools
#### **Tools:** Full Terraform + Jamf Pro stack + Go development skills
#### **Outcome:** Custom solutions for complex device management scenarios

---

## Detailed Daily Schedules

### Option 1: Intensive Bootcamp Schedule (7 Days Total)

## Sample Weekly Schedule (Option C: Daily Learning - Most Common Choice)

### Daily Structure (2 hours/day):
#### **Hour 1:** New concept introduction and theory
#### **Hour 2:** Hands-on practice and lab work
#### **Weekly:** Q&A session and progress review

### Weekly Progression Example:
#### **Weeks 1-3:** Module 1 (Terraform Fundamentals)
#### **Weeks 4-6:** Module 2 (Jamf Pro Provider)  
#### **Weeks 7-9:** Module 3 (Terraform Cloud)
#### **Week 10:** Hack Day 1 (4 hours × 2 days)
#### **Weeks 11-14:** Module 4 (Device Management)
#### **Weeks 15-17:** Module 5 (Modules & Reusability)
#### **Weeks 18-20:** Module 6 (CI/CD & Production)
#### **Week 20:** Hack Day 2 (4 hours × 2 days)

*This provides natural break points and allows for concept absorption between modules.*

---

## Prerequisites & Setup Requirements

### Technical Prerequisites:
#### **STRONG:** Deep Jamf Pro expertise (policies, groups, apps, profiles, prestage enrollment)
#### **STRONG:** Apple device management experience (macOS, iOS enterprise deployment)
#### **WEAK/NONE:** Command line proficiency (will need significant training)
#### **NONE:** Version control experience (Git will be completely new)
#### **NONE:** Infrastructure as Code concepts (major mindset shift required)
#### **NONE:** CI/CD or pipeline experience (entirely new workflow)
#### **ADVANTAGE:** Go programming experience (enables custom tooling)
#### **ASSUMPTION:** Team knows Jamf API concepts but hasn't automated with it

### Required Setup:
- Terraform CLI installed (latest stable version)
- Jamf Pro test/development instance access
- Code editor with HCL syntax support (VS Code recommended)
- Git and GitHub/GitLab access
- Terraform Cloud account and organization setup
#### **Jamf Pro Specific:**
  - OAuth2 API client credentials
  - Appropriate API roles and privileges
  - Test devices (physical or virtual) for policy testing

### Jamf Pro Environment Requirements:
#### **Development Jamf Pro instance** (separate from production)
#### **API Client Configuration:**
  - Client ID and Client Secret for OAuth2
  - API roles with appropriate privileges for training scenarios
  - Load balancer lock configuration if using Jamf Cloud
#### **Test Device Pool:**
  - Mix of macOS and iOS test devices
  - Devices enrolled in test Jamf Pro instance
  - Various device models for testing compatibility

### Terraform Cloud Setup:
- Organization created with team access
- Workspaces configured for different environments
- Variable sets for Jamf Pro credentials
- VCS integration configured (GitHub/GitLab)
- Appropriate workspace permissions for team members

---

## Assessment Methods

### Practical Assessments:
1. **Module 1:** Deploy basic device management setup (groups, policies, user accounts)
2. **Module 2:** Implement Terraform Cloud workflow with variable-driven device configurations
3. **Module 3:** Create and use custom module for device onboarding automation
4. **Module 4:** Set up complete CI/CD pipeline for device management policy deployment

### Hack Day Challenges:
1. **Hack Day 1:** Innovative device onboarding or app deployment automation
2. **Hack Day 2:** Custom integration or Go-based tooling for Jamf Pro management

### Capstone Project Options:
#### **Option A:** Complete device management infrastructure for new employee onboarding (enrollment, apps, policies, groups)
#### **Option B:** Multi-environment device policy deployment pipeline with approval workflows
#### **Option C:** Migration of existing manual Jamf Pro configurations to Terraform automation
#### **Option D:** Custom Go-based tool for Jamf Pro management integrated with Terraform

### Knowledge Checks:
- Daily quick quizzes on Jamf Pro concepts and Terraform syntax (5-10 minutes)
- Peer code reviews of device management configurations
- Troubleshooting scenarios specific to Apple device management
- Best practices discussions for device security and compliance

---

## Resources & Materials

### Essential Documentation:
- Official Terraform documentation and best practices
#### **Jamf Pro Terraform Provider:** deploymenttheory/jamfpro documentation
- Jamf Pro API documentation (Classic and Pro APIs)
- Terraform Cloud documentation and workspace management
#### **Go Resources:** Since provider is built in Go and team has Go experience

### Recommended Reading:
- "Terraform: Up & Running" by Yevgeniy Brikman
- "Infrastructure as Code" by Kief Morris  
- Jamf Pro Administrator's Guide
#### **Apple Device Management Best Practices**

### Community Resources:
#### **Mac Admins Slack:** #terraform-provider-jamfpro channel
- Jamf Nation community forums
#### **GitHub:** deploymenttheory/terraform-provider-jamfpro examples
- Jamf-Concepts/terraform-jamf-platform repository

### Tools & Extensions:
- Terraform Language Server for VS Code
- terraform-docs for documentation
- tflint for linting and validation  
#### **Go-based Tools:** Leverage team's Go skills for custom tooling
- Jamf Pro API testing tools (Postman collections)

### Practice Environments:
- Jamf Pro trial/development instances
#### **Terraform Cloud free tier** (perfect for team collaboration)
- Apple device simulators for iOS testing
- VMware/Parallels for macOS testing environments

### Jamf Pro Specific Resources:
#### **Provider Examples:** 60+ real resources from deploymenttheory/terraform-provider-jamfpro/examples
#### **Core Resources Covered:**
  - Device Management: jamfpro_policy, jamfpro_computer_prestage_enrollment, jamfpro_mobile_device_prestage_enrollment
  - Groups: jamfpro_smart_computer_group, jamfpro_static_computer_group, jamfpro_smart_mobile_device_group
  - Applications: jamfpro_mac_application, jamfpro_mobile_device_application, jamfpro_app_installer
  - Configuration: jamfpro_macos_configuration_profile_plist, jamfpro_mobile_device_configuration_profile_plist
  - Accounts: jamfpro_account, jamfpro_account_group, jamfpro_user_group
  - Infrastructure: jamfpro_site, jamfpro_category, jamfpro_building, jamfpro_department
  - Security: jamfpro_disk_encryption_configuration, jamfpro_restricted_software, jamfpro_webhook
#### **API Testing:** Jamf Pro Swagger documentation and provider SDK logging
#### **Device Management Scenarios:** Complete Apple device lifecycle automation
#### **Integration Examples:** Jamf Pro + CI/CD + Terraform Cloud workflows

---

## Success Metrics & Follow-up

### Immediate Success Indicators:
- All participants can independently deploy and manage Jamf Pro device configurations
- Team can collaborate effectively using Terraform Cloud workspaces
- Participants demonstrate understanding of Jamf Pro provider specifics and Apple device management
- Security best practices for device management are understood and implemented
#### **Hack Day Outcomes:** Creative solutions developed for real device management challenges

### 30-Day Follow-up Goals:
- Team has migrated at least one production device management workflow to Terraform
- CI/CD pipeline is operational for Jamf Pro policy and configuration changes
- Team is contributing to/maintaining internal Jamf Pro module library
- Device onboarding and app deployment processes are fully automated
#### **Innovation Adoption:** Solutions from hack days are implemented in production

### 90-Day Maturity Markers:
- Advanced device management features are implemented via code
- Team is mentoring others and expanding Apple device automation adoption
- Custom modules are shared across organization for device management
- All device configurations are fully versioned, auditable, and automated
#### **Custom Tooling:** Go-based tools developed for enhanced Jamf Pro automation

---

## Cost Estimates (Realistic for 200-Hour Curriculum)

### Training Costs (per person):
#### **Jamf Pro development instance:** $0-50 (if separate instance needed)
#### **Terraform Cloud:** $0 (free tier sufficient for training)
#### **Training materials & resources:** $100-150
#### **Test devices/simulators:** $0-50 (mostly existing equipment)
#### **Trainer/instructor costs:** Variable (internal vs external)
#### **Total per person (excluding instructor):** $100-250

### Time Investment Cost Analysis:
Based on 200 hours total per person for complete curriculum:

| Delivery Option | Calendar Duration | Daily Commitment | Opportunity Cost Impact |
|-----------------|-------------------|------------------|------------------------|
| **Option A: Full-Time** | 5 weeks | 8 hours/day | High (100% unavailable) |
| **Option B: Half-Time** | 10 weeks | 4 hours/day | Medium-High (50% capacity) |
| **Option C: Daily Learning** | 20 weeks | 2 hours/day | Medium (25% capacity reduction) |
| **Option D: Part-Time** | 40 weeks | 1 hour/day | Low (12.5% capacity reduction) |
| **Option E: Sprint Hybrid** | 14-16 weeks | Variable | Medium (periodic high impact) |

### Team Impact Calculation (5 people):
#### **Total person-hours:** 1,000 hours (200 × 5)
#### **Equivalent full-time weeks:** 25 weeks of one person's time
#### **Calendar commitment range:** 5 weeks to 10 months depending on delivery option

---

## Jamf Pro Provider Specific Considerations

### Key Provider Features to Master:
#### **Authentication:** OAuth2 client configuration and credential management
#### **Load Balancing:** Understanding jamfpro_load_balancer_lock for Jamf Cloud
#### **Parallelism:** Setting parallelism to 1 for reliable API operations  
#### **Rate Limiting:** Managing API call frequency and provider delays
#### **Resource Types:** Policies, groups, accounts, apps, configuration profiles, sites

### Common Jamf Pro Resources in Training:
- `jamfpro_account` and `jamfpro_account_group` for user management
- `jamfpro_policy` for device configuration enforcement
- `jamfpro_computer_group` and `jamfpro_mobile_device_group` for device organization
- `jamfpro_app_installer` for software deployment automation
- `jamfpro_configuration_profile` for device settings management

### Go Development Advantages:
#### **Provider Understanding:** Deep insight into how the provider works internally
#### **Custom Tooling:** Ability to build complementary Go tools for device management
#### **Debugging:** Better understanding of provider error messages and behavior
#### **Extensions:** Potential for contributing to or extending the provider itself

---

## Choosing the Right Delivery Option

### Choose **Option A: Full-Time Immersive (5 weeks)** if:
- Team can be fully dedicated to learning (new hires, role transition)
- Urgent business need for Jamf Pro automation
- High training budget and management support
- Team prefers intensive, focused learning environment

### Choose **Option B: Half-Time Intensive (10 weeks)** if:
- Can significantly reduce current workload
- Need reasonably fast capability development
- Team handles intensive learning well
- Moderate urgency for automation capabilities

### Choose **Option C: Daily Learning (20 weeks)** if:
#### **Most common choice** - balances learning with work responsibilities
- Team can commit 2 focused hours daily
- Steady, sustainable learning pace preferred  
- Want to integrate learning with ongoing projects gradually

### Choose **Option D: Part-Time Extended (40 weeks)** if:
- Team has heavy ongoing operational responsibilities
- Very limited time availability for training
- Long-term strategic initiative rather than urgent need
- Prefer minimal disruption to current productivity

### Choose **Option E: Sprint Hybrid (14-16 weeks)** if:
- Agile team methodology and culture
- Want intensive bursts followed by practical application
- Can accommodate periodic high-impact training periods
- Prefer learning integrated with real project cycles

---

## Implementation Recommendations

### **Most Realistic for Jamf Expert Teams:** Extended Learning Program
#### **Duration:** 3-4 hours per day over 25-30 weeks (6-7.5 months)
#### **Rationale:** DevOps concepts require significant mental model shifts
#### **Benefits:** Allows gradual transition from GUI-based to code-based management
#### **Integration:** Can parallelize learning with current Jamf responsibilities

### **Fastest Time-to-Value:** Option A (Full-Time Immersive)  
- Complete expertise in 5 weeks
- Requires significant organizational commitment
- Highest retention due to intensive focus
- Best ROI if team can be dedicated

### **Best for Experimentation:** Option E (Sprint Hybrid)
- Combines intensive learning with practical application
- Natural integration points for real projects
- Flexible scheduling around business needs
- Hack days align well with sprint boundaries

---

## Sample Hack Day Challenges

### Hack Day 1 - Device Management Innovation:
#### **Challenge A:** Zero-touch device setup automation for new employees
#### **Challenge B:** Dynamic app deployment based on user role and device type
#### **Challenge C:** Automated compliance checking and remediation workflows
#### **Challenge D:** Custom device inventory and reporting automation

### Hack Day 2 - Integration & Custom Solutions:
#### **Challenge A:** Jamf Pro + HR system integration for automated device assignment
#### **Challenge B:** Go-based CLI tool for simplified Terraform + Jamf Pro operations  
#### **Challenge C:** Advanced security automation (patch management, compliance reporting)
#### **Challenge D:** Multi-environment device management with approval workflows