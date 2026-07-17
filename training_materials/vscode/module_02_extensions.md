# 🧩 Module 02 - Installing Extensions

*Duration: 30 minutes | Labs: 3 | Difficulty: 🟢 Beginner*

---

## 🎯 Learning Objectives

By the end of this module, you will be able to:

- ✅ Find, install, and manage extensions from the Extensions view and the `code` CLI
- ✅ Install and switch colour themes and file icon themes
- ✅ Install the HashiCorp Terraform extension and explain what a language extension provides
- ✅ Install the quality-of-life extensions used throughout this training programme
- ✅ Share extension recommendations with your team via `.vscode/extensions.json`

---

## 🎨 1. Installing Themes

Out of the box VS Code is deliberately minimal - most functionality ships as **extensions** from the [Visual Studio Marketplace](https://marketplace.visualstudio.com/VSCode). The gentlest introduction is themes, because they're safe to install, easy to preview, and instantly visible.

Two kinds matter:

- **Color themes** change the editor and UI colours (`Cmd+K Cmd+T` / `Ctrl+K Ctrl+T` to switch between installed ones)
- **File icon themes** change the icons in the Explorer - genuinely useful in a Terraform repo, where a good icon theme makes `.tf`, `.tfvars`, and `.md` files distinguishable at a glance

To install: open the **Extensions view** (`Cmd+Shift+X` / `Ctrl+Shift+X`), search, and click **Install**. Every extension page shows an install count and rating - prefer widely-used extensions.

**📖 Read the docs:**

- 🔗 [Themes](https://code.visualstudio.com/docs/configure/themes)

### 💻 **Exercise 2.1**: Install a Theme

**Duration**: 5 minutes

1. Open the Extensions view and search for `Material Icon Theme` (or any icon theme you like); install it and apply it when prompted
2. Open the Command Palette → **Preferences: Color Theme**, and arrow through the built-in themes to preview them live
3. Optionally search the Extensions view for a colour theme (e.g. `One Dark Pro`, `GitHub Theme`), install it, and select it
4. Look at `training_essentials/` in the Explorer - `.tf` and `.md` files should now have distinct icons

---

## 🌐 2. Additional Languages and Debuggers

VS Code ships with strong support for JavaScript/TypeScript and basic colouring for many languages - everything else arrives via **language extensions**. For this training programme the essential one is **HashiCorp Terraform**, which gives you:

- **Syntax highlighting** for `.tf` and `.tfvars` files
- **IntelliSense** - completion for resource types, attributes, and provider schemas (you'll use this heavily in Module 03)
- **Formatting** - `terraform fmt` wired into VS Code's Format Document / format-on-save
- **Validation** - squiggles and Problems-panel entries for syntax and schema errors, before you ever run `terraform validate`

Install it from the Extensions view, or from the terminal:

```bash
code --install-extension HashiCorp.terraform
```

The same mechanism delivers **debuggers**: extensions like the built-in JavaScript debugger, the Python extension's debugger, or the Bash debugger contribute the run/step/breakpoint machinery you'll meet in Module 07. Language + debugger extensions are why one editor can cover Terraform today and Python tomorrow.

The full recommended extension set for this programme (including cloud CLIs and remote development) is maintained in the [Terraform course prerequisites](../terraform/module_00_course_overview.md#code-editor-vs-code-required) - install at minimum the HashiCorp Terraform extension now.

### 💻 **Exercise 2.2**: Install Terraform Language Support

**Duration**: 10 minutes

1. Install the **HashiCorp Terraform** extension (`HashiCorp.terraform`) - check the publisher is verified (blue tick)
2. Open `training_essentials/lab_1_creating_resources/main.tf` - the file should now be fully syntax-highlighted, and the Status Bar language mode should read `Terraform`
3. Hover over the `variable` keyword and over an attribute like `description` - note the documentation popups
4. Open the Command Palette and run **Format Document** on the file - this now runs the Terraform formatter
5. Break something deliberately: delete a closing brace `}`, and watch the red squiggle and the **Problems** panel entry appear. Undo with `Cmd+Z` / `Ctrl+Z`

---

## 🛠️ 3. Additional Editor Functionality

The third category of extension adds *editor features* rather than language support. These are the ones this training programme recommends (they also appear in [Topic 1.2 of the master plan](../0.0.0_module_overview.md)):

| Extension               | ID                          | What it adds                                                        |
| ----------------------- | --------------------------- | ------------------------------------------------------------------- |
| **GitLens**             | `eamodio.gitlens`           | Inline Git blame, rich history views - who changed this line and why |
| **indent-rainbow**      | `oderwat.indent-rainbow`    | Colours indentation levels - invaluable in nested HCL blocks         |
| **Better Comments**     | `aaron-bond.better-comments`| Colour-codes `TODO`, `!` warnings, `?` questions in comments         |
| **CodeSnap**            | `adpyke.codesnap`           | Screenshot-quality images of code for docs and reviews               |

Install them all in one go:

```bash
code --install-extension eamodio.gitlens
code --install-extension oderwat.indent-rainbow
code --install-extension aaron-bond.better-comments
code --install-extension adpyke.codesnap
```

**🤝 Sharing with your team:** a repo can carry a `.vscode/extensions.json` file listing recommended extension IDs. When someone opens the folder, VS Code prompts them to install the recommendations - the editor-tooling equivalent of pinning provider versions:

```json
{
  "recommendations": [
    "hashicorp.terraform",
    "eamodio.gitlens",
    "oderwat.indent-rainbow"
  ]
}
```

💡 **Pro Tip**: Extensions run code on your machine. Stick to verified publishers and high install counts, and periodically prune ones you don't use - **Extensions view → installed list → ⚙️ → Disable/Uninstall**.

### 💻 **Exercise 2.3**: Install the Training Toolkit

**Duration**: 10 minutes

1. Install the four extensions from the table above (UI or CLI - your choice)
2. Open `training_essentials/lab_3_fixing_problems/computer_groups.tf` and confirm indent-rainbow colours the nested blocks
3. Add a comment `# TODO: review this resource` to any line and confirm Better Comments highlights it - then undo
4. Click on a line in the file and look for GitLens's subtle inline blame annotation at the end of the line
5. Run `code --list-extensions` in a terminal and confirm all your installed extension IDs are listed

---

## 🧠 Chapter Quiz

**3 questions** - answers are collapsed below.

1. **What does the HashiCorp Terraform extension provide?**
   - A) The `terraform` CLI binary itself
   - B) Syntax highlighting, IntelliSense, formatting, and validation for `.tf` files
   - C) A Jamf Pro tenant to practise against
   - D) Remote state storage

2. **Which command installs an extension from the terminal?**
   - A) `code --install-extension HashiCorp.terraform`
   - B) `terraform install extension`
   - C) `git install HashiCorp.terraform`
   - D) `code --add HashiCorp.terraform`

3. **What is `.vscode/extensions.json` for?**
   - A) Storing your personal theme choice
   - B) Caching downloaded extensions
   - C) Recommending extensions to anyone who opens the repository
   - D) Disabling all extensions in the workspace

<details>
<summary>🔍 Click for Answers</summary>

1. **B** - It's a language extension: editor features for Terraform files. The `terraform` CLI is installed separately ([Lab Setup](../terraform/module_03_lab_setup.md))
2. **A** - `code --install-extension <publisher>.<name>` scripts what the Extensions view does
3. **C** - Committed extension recommendations; VS Code prompts teammates to install them when they open the folder

</details>

---

## ✅ Summary

- Extensions come from the Marketplace via the Extensions view or `code --install-extension`
- Themes (colour + file icons) are the safe way to learn the install/manage workflow
- **HashiCorp Terraform** is the essential language extension for this programme; language and debugger extensions are how one editor supports many stacks
- GitLens, indent-rainbow, Better Comments, and CodeSnap are this programme's quality-of-life set
- `.vscode/extensions.json` shares recommendations with your team through the repo

**Next:** [Module 03 - Writing and Editing Code](./module_03_writing_and_editing.md) ➡️

## 📚 Additional Resources

- [Extension Marketplace](https://marketplace.visualstudio.com/VSCode)
- [Themes](https://code.visualstudio.com/docs/configure/themes)
- [HashiCorp Terraform extension](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)
- [Terraform course extension list](../terraform/module_00_course_overview.md#code-editor-vs-code-required)
