# ✍️ Module 03 - Writing and Editing Code

*Duration: 60 minutes | Labs: 6 | Difficulty: 🟢 Beginner*

---

## 🎯 Learning Objectives

By the end of this module, you will be able to:

- ✅ Split, arrange, and manage editor groups to view multiple files at once
- ✅ Navigate a codebase with Go to Definition, symbol search, and breadcrumbs
- ✅ Use IntelliSense to write Terraform faster and with fewer errors
- ✅ Apply refactoring tools: Rename Symbol, multi-cursor editing, and search-and-replace across files
- ✅ Insert built-in snippets and author your own Terraform snippets

> [!Tip]
> The exercises in this module edit files under `training_essentials/`. To keep your clone clean, either work on a copy (`cp -r training_essentials /tmp/vscode-practice && code /tmp/vscode-practice`) or undo/`git restore` your changes when done - a workflow you'll formalise in Module 04.

---

## 🪟 1. Arranging Editor Windows

Terraform work is inherently multi-file: a resource in one file references a variable declared in another and a value assigned in a third. Splitting the editor lets you see them together:

- **Split right**: `Cmd+\` / `Ctrl+\`, or drag a tab to the side of the editor area
- **Move focus between groups**: `Cmd+1`, `Cmd+2`... / `Ctrl+1`, `Ctrl+2`...
- **Grid layouts**: drag tabs to any edge (top/bottom/left/right) for 2x2 and beyond
- **Open to the side from the Explorer**: `Option+click` / `Alt+click` a file

Related tab tricks: pin tabs you keep returning to (right-click → **Pin**), and note that *italic* tab titles mean preview mode - single-click opens a preview that gets replaced by the next file; double-click (or start editing) to keep it open.

**📖 Read the docs:**

- 🔗 [Custom layout](https://code.visualstudio.com/docs/configure/custom-layout)

### 💻 **Exercise 3.1**: Work Across Split Editors

**Duration**: 5 minutes

1. Open `training_essentials/lab_3_fixing_problems/main.tf`
2. Split the editor (`Cmd+\` / `Ctrl+\`) and open `computer_groups.tf` in the right-hand group via `Cmd+P` / `Ctrl+P`
3. Drag the `policy.tf` tab to the bottom edge of the editor area to create a third group
4. Cycle focus between the three groups with `Cmd+1/2/3` / `Ctrl+1/2/3`
5. Close the extra groups (`Cmd+W` / `Ctrl+W` closes editors; a group disappears when empty)

---

## 🧭 2. Code Navigation

Clicking through the Explorer doesn't scale. VS Code's navigation commands do - and with the Terraform extension installed, they understand HCL:

| Command                | Shortcut                              | Terraform example                                        |
| ---------------------- | ------------------------------------- | -------------------------------------------------------- |
| Quick Open (file)      | `Cmd+P` / `Ctrl+P`                    | Jump to `computer_groups.tf`                             |
| Go to Symbol in file   | `Cmd+Shift+O` / `Ctrl+Shift+O`        | List every `resource`/`variable` block in the file       |
| Go to Symbol in workspace | `Cmd+T` / `Ctrl+T`                 | Find a resource by name across all `.tf` files           |
| Go to Definition       | `F12` (or `Cmd/Ctrl+click`)           | From `var.jamfpro_client_id` to its `variable` block     |
| Go to References       | `Shift+F12`                           | Everywhere a variable or resource is used                |
| Go to Line             | `Ctrl+G`                              | Jump to the line from a `terraform validate` error       |
| Navigate back / forward | `Ctrl+-` / `Ctrl+Shift+-` (macOS)、`Alt+←` / `Alt+→` (Win/Linux) | Retrace your jumps |

**Breadcrumbs** (the path above the editor) are clickable: select any segment to browse sibling files or symbols.

**📖 Read the docs:**

- 🔗 [Code navigation](https://code.visualstudio.com/docs/editing/editingevolved)

### 💻 **Exercise 3.2**: Navigate a Terraform Config

**Duration**: 10 minutes

1. Open `training_essentials/lab_3_fixing_problems/main.tf`
2. Find a usage of a `var.` reference, and press `F12` (Go to Definition) on it - you should land on the `variable` block
3. On that variable block's name, press `Shift+F12` (Go to References) and walk through every place it's used
4. Press `Ctrl+-` (macOS) / `Alt+←` (Win/Linux) repeatedly to retrace your steps back to where you started
5. Use `Cmd+Shift+O` / `Ctrl+Shift+O` to list the file's blocks, then `Cmd+T` / `Ctrl+T` to find a resource defined in a *different* file of the same lab

---

## 💡 3. Taking Advantage of IntelliSense

IntelliSense is the umbrella term for completions, parameter hints, and hover documentation. With the Terraform extension it is schema-aware: it knows which attributes a `jamfpro_policy` accepts because it reads the provider's schema (after `terraform init` has downloaded providers, completions get richer).

The habits to build:

- **Trigger it**: suggestions appear as you type; force them with `Ctrl+Space`
- **Accept it**: `Tab` or `Enter` accepts the highlighted suggestion
- **Read as you go**: hover any resource type or attribute for its documentation - no browser round-trip
- **Trust the squiggles**: an unknown attribute gets flagged immediately, long before `terraform plan` would tell you

💡 **Pro Tip**: In a `.tf` file, type `resource "` and pause - the extension completes provider resource *types*. Completion inside the block then offers only *valid attributes* for that type. Writing Terraform by completion instead of memory eliminates a whole class of typo bugs.

**📖 Read the docs:**

- 🔗 [IntelliSense](https://code.visualstudio.com/docs/editing/intellisense)

### 💻 **Exercise 3.3**: Write HCL with IntelliSense

**Duration**: 10 minutes

1. In your practice copy of `lab_1_creating_resources`, create a new file `practice.tf`
2. Type `resource "jamfpro` and pause - browse the completion list of resource types (if the list is sparse, the provider schema isn't downloaded yet; the exercise still works with `variable` and `output` blocks, which are core-language completions)
3. Inside a new `variable "practice_name" {}` block, press `Ctrl+Space` and add `type` and `description` attributes from the completion list
4. Hover over `type` to read its hover documentation
5. Misspell an attribute (e.g. `descriptionn`) and confirm the diagnostic squiggle, then fix it and delete `practice.tf`

---

## 🔧 4. Refactoring Code

Refactoring means changing code structure safely. Three tools cover most Terraform editing:

**Rename Symbol (`F2`)** - rename a variable or resource label and every reference updates together. Far safer than find/replace for names that appear as substrings of other names.

**Multi-cursor editing** - edit many places at once:
- `Cmd+D` / `Ctrl+D`: select the next occurrence of the current word (press repeatedly)
- `Option+click` / `Alt+click`: place additional cursors by hand
- `Option+Cmd+↓` / `Ctrl+Alt+↓`: add a cursor on the line below

**Search and replace across files (`Cmd+Shift+H` / `Ctrl+Shift+H`)** - workspace-wide replace with per-match preview and toggle. Use the Search view's include/exclude filters (e.g. include `*.tf`) to scope it.

⚠️ **Important**: For Terraform *resource labels* remember the state implication you'll learn in the Terraform course - renaming `jamfpro_policy.old_name` in code means Terraform sees a delete-and-recreate unless you use `moved` blocks or `terraform state mv`. The editor makes the rename easy; whether to rename is an infrastructure decision.

**📖 Read the docs:**

- 🔗 [Refactoring](https://code.visualstudio.com/docs/editing/refactoring)
- 🔗 [Basic editing](https://code.visualstudio.com/docs/editing/codebasics)

### 💻 **Exercise 3.4**: Refactor Safely

**Duration**: 10 minutes

Work in a **copy** of `training_essentials/lab_3_fixing_problems` (see the tip at the top of this module):

1. In `main.tf`, put the cursor on a variable name in its `variable` block, press `F2`, and rename it (e.g. add a `_renamed` suffix) - confirm references updated, then `F2` to rename it back
2. Open `computer_groups.tf`, select a repeated word, and press `Cmd+D` / `Ctrl+D` three times - type to replace all selections simultaneously, then undo
3. Open Search (`Cmd+Shift+F` / `Ctrl+Shift+F`) and search for `jamfpro` across the folder; note the match count
4. Switch to Replace (`Cmd+Shift+H` / `Ctrl+Shift+H`), and use **files to include** = `*.tf` to scope a replace preview - review the diff-style preview per match, but don't apply it
5. Undo/restore any leftover changes

---

## ⚡ 5. Using Built-In Code Snippets

Snippets are templates with **tab stops** - placeholders you jump between with `Tab`. They appear in the IntelliSense list (marked with a box icon), or via Command Palette → **Snippets: Insert Snippet**.

The Terraform extension ships snippets for common HCL scaffolding - for example type `fore` and accept the `for_each` snippet, or use block snippets for `variable`/`output`/`module` scaffolds. Markdown, JSON, and shell files have their own built-in sets. The workflow is always the same:

1. Type the snippet **prefix** (or press `Ctrl+Space`)
2. Accept the snippet
3. `Tab` through the placeholders, typing over each
4. `Esc` to finish

### 💻 **Exercise 3.5**: Insert Snippets

**Duration**: 5 minutes

1. In a scratch `.tf` file, run Command Palette → **Snippets: Insert Snippet** and browse what the Terraform extension provides
2. Insert one (e.g. a `for_each` or `variable` snippet) and `Tab` through its placeholders
3. Open a scratch `.md` file, type `link`, and note that Markdown has its own snippet set - snippets are always language-scoped
4. Delete the scratch files

---

## 🛠️ 6. Creating Custom Code Snippets

When you find yourself typing the same boilerplate weekly - a provider block, a standard resource shape, your team's file header - turn it into a snippet. Command Palette → **Snippets: Configure Snippets** → pick the language (e.g. `terraform`) creates a JSON file like `terraform.json` in your user snippets folder.

Anatomy of a snippet:

```json
{
  "Jamf Pro Resource Block": {
    "prefix": "jpres",
    "body": [
      "resource \"jamfpro_${1:resource_type}\" \"${2:label}\" {",
      "  name = \"${3:name}\"",
      "  $0",
      "}"
    ],
    "description": "Scaffold a Jamf Pro resource block"
  }
}
```

- **`prefix`** - what you type to trigger it
- **`body`** - the lines inserted; `$1`, `$2`... are tab stops in order, `${1:placeholder}` sets default text, `$0` is the final cursor position
- Snippets can also be **workspace-scoped** (a `.code-snippets` file in `.vscode/`) so the whole team gets them from the repo - the same sharing pattern as workspace settings and extension recommendations

**📖 Read the docs:**

- 🔗 [Snippets in Visual Studio Code](https://code.visualstudio.com/docs/editing/userdefinedsnippets)

### 💻 **Exercise 3.6**: Author a Terraform Snippet

**Duration**: 15 minutes

1. Command Palette → **Snippets: Configure Snippets** → select **terraform** - VS Code opens (or creates) your `terraform.json` user snippets file
2. Add the `jpres` snippet from the example above and save
3. In a scratch `.tf` file, type `jpres`, accept the suggestion, and `Tab` through the placeholders to build a resource block
4. Extend the snippet: add a fourth tab stop for a second attribute, save, and trigger it again to confirm
5. **Challenge**: create a second snippet `jpvar` that scaffolds a `variable` block with `description`, `type`, and `sensitive = true` - modelled on the variables in `training_essentials/lab_1_creating_resources/main.tf`

---

## 🧠 Chapter Quiz

**6 questions** - answers are collapsed below.

1. **Which shortcut splits the current editor to the side?**
   - A) `Cmd+B` / `Ctrl+B`
   - B) `Cmd+\` / `Ctrl+\`
   - C) `Cmd+J` / `Ctrl+J`
   - D) `F2`

2. **You're looking at `var.jamfpro_client_id` and want to see its `variable` block. Fastest route?**
   - A) Scroll through every file
   - B) `F12` - Go to Definition
   - C) Reopen the folder
   - D) Run `terraform plan`

3. **What does `Ctrl+Space` do?**
   - A) Formats the document
   - B) Manually triggers IntelliSense suggestions
   - C) Opens the terminal
   - D) Comments out the line

4. **Why prefer Rename Symbol (`F2`) over plain find/replace for renaming a variable?**
   - A) It's the only way to rename in VS Code
   - B) It updates only real references, not unrelated text that happens to contain the same substring
   - C) It automatically runs `terraform apply`
   - D) Find/replace can't span multiple files

5. **In a snippet body, what does `${1:label}` mean?**
   - A) A comment
   - B) The snippet's trigger prefix
   - C) The first tab stop, pre-filled with the placeholder text `label`
   - D) An environment variable

6. **How do you share custom snippets with your whole team?**
   - A) You can't - snippets are always personal
   - B) Email your `terraform.json` around
   - C) Commit a `.code-snippets` file inside the repo's `.vscode/` folder
   - D) Publish a theme

<details>
<summary>🔍 Click for Answers</summary>

1. **B** - `Cmd+\` / `Ctrl+\` splits the editor; `Cmd+B` toggles the Side Bar, `Cmd+J` the Panel
2. **B** - Go to Definition jumps straight to the declaration; `Cmd/Ctrl+click` does the same
3. **B** - It forces the suggestion list open at the cursor
4. **B** - Rename Symbol is semantic: it renames the symbol and its references, nothing else
5. **C** - Tab stop 1 with default text `label`; `$0` marks where the cursor ends up
6. **C** - Workspace snippet files in `.vscode/*.code-snippets` travel with the repository

</details>

---

## ✅ Summary

- Split editors and editor groups let you keep `variables`, `resources`, and usages in view together
- Go to Definition / References / Symbol turn a multi-file Terraform config into a navigable graph
- IntelliSense with the Terraform extension is schema-aware - write by completion, not memory
- `F2` rename, multi-cursor, and scoped search/replace cover day-to-day refactoring; remember the state implications of renaming resource labels
- Snippets (built-in and custom) eliminate boilerplate; workspace snippet files share them via the repo

**Next:** [Module 04 - Integrating with Source Control](./module_04_source_control.md) ➡️

## 📚 Additional Resources

- [Basic editing](https://code.visualstudio.com/docs/editing/codebasics)
- [IntelliSense](https://code.visualstudio.com/docs/editing/intellisense)
- [Refactoring](https://code.visualstudio.com/docs/editing/refactoring)
- [Snippets](https://code.visualstudio.com/docs/editing/userdefinedsnippets)
- [Tips and tricks](https://code.visualstudio.com/docs/editing/tips-and-tricks)
