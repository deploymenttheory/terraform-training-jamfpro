# 🖥️ VS Code for Infrastructure Engineers - Course Overview

*Total Duration: ~5 hours | Modules: 8 | Difficulty: 🟢 Beginner*

---

## 🎯 Why This Course Exists

Visual Studio Code is the primary development environment for everything else in this training programme: writing Terraform for Jamf Pro, working with Git and GitHub, and running commands in a terminal. Before you can be productive with Infrastructure as Code, you need to be comfortable in the editor you'll spend all day in.

This course teaches **the IDE itself** - layout, settings, extensions, editing, source control, terminal, tasks, and debugging. It deliberately does **not** cover AI/agent features (Copilot, agent mode); the focus is on core editor skills that everything else builds on.

## 📖 How This Course Works

VS Code has excellent official documentation, so this course doesn't try to rewrite it. Each lesson follows the same pattern:

1. **🧭 Context** - a short orientation explaining what the feature is and why it matters for Terraform/Git work
2. **📖 Read the docs** - links to the specific official documentation pages to read
3. **💻 Exercises** - hands-on tasks done in *this repository*, using the Terraform labs in [`training_essentials/`](../../training_essentials/)
4. **🧠 Chapter quiz** - a short knowledge check with collapsible answers

> [!Tip]
> Keep the official docs open in a browser tab beside VS Code while you work through each module. The skill you're really building is *knowing where to look*.

## 📋 Module Overview

| Module | Topic                                                                | Duration | Difficulty      |
| ------ | -------------------------------------------------------------------- | -------- | --------------- |
| 01     | [🚀 Configuring and Getting Started](./module_01_getting_started.md) | 45 min   | 🟢 Beginner     |
| 02     | [🧩 Installing Extensions](./module_02_extensions.md)                | 30 min   | 🟢 Beginner     |
| 03     | [✍️ Writing and Editing Code](./module_03_writing_and_editing.md)    | 60 min   | 🟢 Beginner     |
| 04     | [🔀 Integrating with Source Control](./module_04_source_control.md)  | 45 min   | 🟢 Beginner     |
| 05     | [⌨️ Configuring and Using the Terminal](./module_05_terminal.md)     | 45 min   | 🟢 Beginner     |
| 06     | [🤖 Using Tasks](./module_06_tasks.md)                               | 40 min   | 🟡 Intermediate |
| 07     | [🐞 Debugging in VS Code](./module_07_debugging.md)                  | 45 min   | 🟡 Intermediate |
| 08     | [🎓 Continue Your Learning Journey](./module_08_conclusion.md)       | 10 min   | 🟢 Beginner     |

## 🧰 Prerequisites

Before starting Module 01, make sure you have:

- **💻 VS Code installed** - [Download VS Code](https://code.visualstudio.com/download)
- **🛤️ `code` available on your `$PATH`** - follow [Launch VS Code from the command line](https://code.visualstudio.com/docs/setup/mac#_launch-vs-code-from-the-command-line) (macOS; on Windows the installer does this for you). Verify with:

  ```bash
  code --version
  ```

- **🔧 Git installed** - [Download Git](https://git-scm.com/downloads). Verify with:

  ```bash
  git --version
  ```

- **🐙 A GitHub account** - [Sign up for GitHub](https://github.com/signup)
- **📦 This repository cloned locally** - the exercises use its files:

  ```bash
  git clone https://github.com/deploymenttheory/terraform-training-jamfpro.git
  ```

Terraform itself is **not** required until Module 06 - and even there, the exercises degrade gracefully if you haven't installed it yet (see [Lab Setup](../terraform/module_03_lab_setup.md)).

## 🗺️ Where This Fits in the Programme

This course is **Topic 1.2: VS Code fundamentals** in the [master training plan](../0.0.0_module_overview.md). It pairs with:

- **Git training** - [`training_materials/git/`](../git/module_01_git_github_overview.md) teaches the concepts; Module 04 here teaches the VS Code workflow for them
- **Terraform training** - [`training_materials/terraform/`](../terraform/module_00_course_overview.md) and [`training_essentials/`](../../training_essentials/) are where you'll apply these editor skills daily

## 📚 Additional Resources

- [Official VS Code documentation](https://code.visualstudio.com/docs)
- [VS Code editing tutorial](https://code.visualstudio.com/docs/editing/getting-started)
- [Keyboard shortcuts reference](https://code.visualstudio.com/docs/configure/keybindings)
- [Tips and tricks](https://code.visualstudio.com/docs/editing/tips-and-tricks)
