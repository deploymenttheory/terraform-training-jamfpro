# 🚀 Module 01 - Configuring and Getting Started with VS Code

*Duration: 45 minutes | Labs: 4 | Difficulty: 🟢 Beginner*

---

## 🎯 Learning Objectives

By the end of this module, you will be able to:

- ✅ Identify the five main areas of the VS Code user interface and what lives in each
- ✅ Open files, folders, and workspaces - from the UI and from the command line with `code`
- ✅ Use the Command Palette and Quick Open to drive VS Code from the keyboard
- ✅ Configure settings through the Settings UI and `settings.json`, and explain user vs workspace scope

---

## 🧭 1. Understanding the Default Layout

When you first open VS Code, everything you see falls into five areas. Learning their names matters because every doc page, tutorial, and error message refers to them:

| Area             | Where          | What it's for                                                                 |
| ---------------- | -------------- | ----------------------------------------------------------------------------- |
| **Activity Bar** | Far left       | Switches between views: Explorer, Search, Source Control, Run & Debug, Extensions |
| **Primary Side Bar** | Left       | Shows the active view (e.g. the file tree when Explorer is selected)          |
| **Editor**       | Centre         | Where you edit files; can be split into multiple editor groups                |
| **Panel**        | Bottom         | Integrated Terminal, Problems, Output, and Debug Console                      |
| **Status Bar**   | Bottom edge    | Current branch, errors/warnings, language mode, cursor position               |

For Terraform work you will live in the **Explorer** (navigating `.tf` files), the **Source Control** view (Git), the **Panel** (running `terraform` commands, reading Problems), and the **Status Bar** (checking which branch you're on *before* you commit).

**📖 Read the docs:**

- 🔗 [User interface](https://code.visualstudio.com/docs/editing/userinterface)
- 🔗 [Getting started tutorial](https://code.visualstudio.com/docs/getstarted/getting-started)

### 💻 **Exercise 1.1**: Tour the Interface

**Duration**: 5 minutes

1. Open VS Code
2. Click each icon in the Activity Bar in turn - Explorer, Search, Source Control, Run and Debug, Extensions - and watch the Side Bar change
3. Toggle the Side Bar closed and open with `Cmd+B` (macOS) / `Ctrl+B` (Windows/Linux)
4. Toggle the Panel with `Cmd+J` / `Ctrl+J`
5. Find these three things in the Status Bar: the language mode of the current file, the line/column position, and the notifications bell

---

## 📂 2. Opening Files and Folders

VS Code is **folder-oriented**: you open a folder (your project root), and features like search, Git integration, and Terraform extension language support work across everything inside it. Opening a lone file works, but you lose most of that context - so for this training, always open the repository folder, not individual `.tf` files.

Three ways to open a folder:

```bash
# 1. From the terminal (requires `code` on your $PATH)
cd ~/GitHub/terraform-training-jamfpro
code .

# 2. From the UI: File → Open Folder...
# 3. From the Welcome screen: "Open Folder..."
```

Once a folder is open:

- **Breadcrumbs** at the top of each editor show where the file sits in the tree
- **Quick Open** (`Cmd+P` / `Ctrl+P`) jumps to any file by fuzzy name matching - faster than clicking through the Explorer
- A **multi-root workspace** (`File → Add Folder to Workspace...`) lets you open several folders at once - useful later when you work on a Terraform config and a module side by side

**📖 Read the docs:**

- 🔗 [Getting started with the editor](https://code.visualstudio.com/docs/editing/getting-started)

### 💻 **Exercise 1.2**: Open the Training Repository

**Duration**: 5 minutes

1. In a terminal, `cd` into your clone of `terraform-training-jamfpro`
2. Run `code .` (if this fails, revisit the [`$PATH` setup](https://code.visualstudio.com/docs/setup/mac#_launch-vs-code-from-the-command-line) from the prerequisites)
3. In the Explorer, expand `training_essentials/lab_1_creating_resources` and open `main.tf`
4. Note the breadcrumb trail above the editor and the `HCL`/`Terraform` language mode in the Status Bar
5. Press `Cmd+P` / `Ctrl+P`, type `lab3main`, and open `lab_3_fixing_problems/main.tf` without touching the mouse

---

## 🎛️ 3. Using the Command Palette

The Command Palette (`Cmd+Shift+P` / `Ctrl+Shift+P`) is the single most important keyboard shortcut in VS Code. **Every** command the editor can run is in there, searchable by name - you never need to memorise where a feature hides in the menus.

The same input box changes behaviour based on its prefix:

| Prefix | Opens with                  | What it does                                  |
| ------ | --------------------------- | --------------------------------------------- |
| `>`    | `Cmd+Shift+P` / `Ctrl+Shift+P` | Run any command ("Git: Clone", "Format Document"...) |
| *(none)* | `Cmd+P` / `Ctrl+P`        | Quick Open - jump to a file by name           |
| `@`    | `Cmd+Shift+O` / `Ctrl+Shift+O` | Jump to a symbol in the current file (e.g. a resource block) |
| `:`    | `Ctrl+G`                    | Go to a line number                           |
| `?`    | -                           | Show help for all the prefixes                |

💡 **Pro Tip**: If you remember only one thing from this module: when you don't know how to do something in VS Code, open the Command Palette and type what you want in plain words.

**📖 Read the docs:**

- 🔗 [Command Palette section of the tutorial](https://code.visualstudio.com/docs/getstarted/getting-started)

### 💻 **Exercise 1.3**: Drive VS Code from the Keyboard

**Duration**: 10 minutes

1. Open the Command Palette and run **View: Toggle Zen Mode** - then run it again to exit (press `Esc` twice also works)
2. Use the Command Palette to run **Preferences: Color Theme** and preview a few themes with the arrow keys (pick any - you'll install more in Module 02)
3. With `training_essentials/lab_1_creating_resources/main.tf` open, press `Cmd+Shift+O` / `Ctrl+Shift+O` and jump between the `variable` blocks using symbol search
4. Press `Ctrl+G`, type `10`, and jump to line 10
5. Open the Command Palette, type `keyboard`, and run **Help: Keyboard Shortcuts Reference** to see the printable cheat sheet for your OS

---

## ⚙️ 4. Configuring Settings

VS Code has two ways to change settings, and they edit the same thing:

- **Settings UI** (`Cmd+,` / `Ctrl+,`) - searchable, discoverable, shows defaults
- **`settings.json`** - the raw JSON behind the UI. Open it via Command Palette → **Preferences: Open User Settings (JSON)**

Settings apply at two **scopes**:

| Scope         | Stored in                                   | Applies to                    | Use for                                        |
| ------------- | ------------------------------------------- | ----------------------------- | ---------------------------------------------- |
| **User**      | Your OS profile (e.g. `~/Library/Application Support/Code/User/settings.json`) | Every window you open | Personal preferences: theme, font size         |
| **Workspace** | `.vscode/settings.json` inside the folder   | Only that folder/workspace    | Team conventions: formatters, file excludes    |

Workspace settings override user settings, and because they live in the repo they can be **committed and shared with your team** - this is the same "configuration as code" idea that motivates Terraform itself.

A settings block you'll want for Terraform work (it makes the HashiCorp Terraform extension format `.tf` files every time you save - the extension itself is installed in Module 02):

```json
{
  "editor.formatOnSave": true,
  "files.autoSave": "onFocusChange",
  "[terraform]": {
    "editor.defaultFormatter": "hashicorp.terraform"
  }
}
```

**📖 Read the docs:**

- 🔗 [User and workspace settings](https://code.visualstudio.com/docs/configure/settings)
- 🔗 [Settings Sync](https://code.visualstudio.com/docs/configure/settings-sync) - roam your settings between machines

### 💻 **Exercise 1.4**: Configure Your Editor

**Duration**: 10 minutes

1. Open Settings (`Cmd+,` / `Ctrl+,`) and search for `auto save`; set **Files: Auto Save** to `onFocusChange`
2. Search for `format on save` and enable **Editor: Format On Save**
3. Open the Command Palette and run **Preferences: Open User Settings (JSON)** - confirm both changes appear as JSON
4. Note the **User** / **Workspace** tabs at the top of the Settings UI - click **Workspace** and observe that it's empty (nothing has been set at workspace scope yet)
5. In the Settings UI, search for `font size` and adjust **Editor: Font Size** to taste

---

## 🧠 Chapter Quiz

**4 questions** - answers are collapsed below.

1. **Which part of the VS Code interface contains the integrated terminal?**
   - A) The Activity Bar
   - B) The Status Bar
   - C) The Panel
   - D) The Primary Side Bar

2. **What does pressing `Cmd+P` / `Ctrl+P` (no prefix) let you do?**
   - A) Run any editor command by name
   - B) Quick Open - jump to a file by fuzzy name match
   - C) Open the Settings UI
   - D) Print the current file

3. **Where are workspace-scoped settings stored?**
   - A) In `~/Library/Application Support/Code/User/settings.json`
   - B) In `.vscode/settings.json` inside the opened folder
   - C) In the Windows registry / macOS defaults
   - D) On your GitHub account

4. **Why is it better to open the repository folder rather than a single `.tf` file?**
   - A) Single files can't be saved
   - B) Folder context enables workspace-wide search, Git integration, and full language support
   - C) VS Code cannot open single files
   - D) It uses less memory

<details>
<summary>🔍 Click for Answers</summary>

1. **C** - The Panel (bottom) hosts the Terminal, Problems, Output, and Debug Console
2. **B** - `Cmd+P`/`Ctrl+P` is Quick Open; adding `>` turns it into the Command Palette
3. **B** - Workspace settings live in `.vscode/settings.json` and can be committed to the repo and shared
4. **B** - Opening the folder gives VS Code project context: search, source control, and extension features all work across the whole tree

</details>

---

## ✅ Summary

- The UI has five named areas - Activity Bar, Side Bar, Editor, Panel, Status Bar - and the docs refer to them constantly
- Open **folders**, not files; `code .` from the repo root is the everyday workflow
- The Command Palette (`Cmd+Shift+P` / `Ctrl+Shift+P`) can run everything; Quick Open (`Cmd+P` / `Ctrl+P`) jumps anywhere
- Settings live in JSON at **user** scope (personal) and **workspace** scope (shareable via the repo)

**Next:** [Module 02 - Installing Extensions](./module_02_extensions.md) ➡️

## 📚 Additional Resources

- [VS Code user interface](https://code.visualstudio.com/docs/editing/userinterface)
- [Settings reference](https://code.visualstudio.com/docs/configure/settings)
- [Custom layout](https://code.visualstudio.com/docs/configure/custom-layout)
- [Keyboard shortcuts](https://code.visualstudio.com/docs/configure/keybindings)
