# 🤖 Module 06 - Using Tasks

*Duration: 40 minutes | Labs: 2 | Difficulty: 🟡 Intermediate*

---

## 🎯 Learning Objectives

By the end of this module, you will be able to:

- ✅ Explain what a VS Code task is and when to use one instead of retyping terminal commands
- ✅ Run auto-detected tasks and browse the task list
- ✅ Author `.vscode/tasks.json` with custom tasks for `terraform fmt`, `validate`, and `plan`
- ✅ Set a default build task and run it with a single keystroke

**Prerequisite:** Terraform CLI installed ([Lab Setup](../terraform/module_03_lab_setup.md)). The authoring exercise works without it, but the tasks won't run successfully.

---

## 🔍 1. Running Auto-Detected Tasks

A **task** is a command VS Code can run for you - build, lint, format, test - defined once and launched from the Command Palette instead of retyped in the terminal. Tasks give you:

- One keystroke instead of remembered shell incantations
- Output in a dedicated terminal, with **problem matchers** that can turn errors in output into clickable entries in the Problems panel
- A shareable definition (`.vscode/tasks.json`) so the whole team runs identical commands - the editor-level cousin of a CI pipeline step

The entry point is Command Palette → **Tasks: Run Task**. VS Code **auto-detects** tasks for ecosystems it recognises - npm scripts in a `package.json`, gulp/grunt/jake files, TypeScript builds. A Terraform repo has none of those, so your task list starts empty - which is precisely why the next lesson teaches you to define your own.

**📖 Read the docs:**

- 🔗 [Tasks in VS Code](https://code.visualstudio.com/docs/debugtest/tasks)

### 💻 **Exercise 6.1**: Explore the Task System

**Duration**: 10 minutes

1. With the training repo open, run Command Palette → **Tasks: Run Task** - observe what's offered (little or nothing: there's nothing to auto-detect in a pure Terraform/Markdown repo)
2. To see auto-detection fire, create a throwaway `package.json` in the repo root:

   ```json
   {
     "name": "scratch",
     "scripts": {
       "hello": "echo hello from an npm task"
     }
   }
   ```

3. Run **Tasks: Run Task** again - an **npm: hello** task now appears (if npm is installed). Run it and watch the output land in a task terminal
4. Delete `package.json` - it was only a demonstration
5. Skim the [tasks documentation](https://code.visualstudio.com/docs/debugtest/tasks) section "Task auto-detection" to see which ecosystems get this for free

---

## 🛠️ 2. Creating Custom Tasks

Custom tasks live in **`.vscode/tasks.json`** in the workspace. Command Palette → **Tasks: Configure Task** → **Create tasks.json file from template** → **Others** scaffolds one.

Here is a complete `tasks.json` giving the core Terraform workflow one-keystroke treatment - it uses `${fileDirname}` so each task runs against the directory of the `.tf` file you currently have open, which fits this repo's many-labs layout:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "terraform: fmt",
      "type": "shell",
      "command": "terraform fmt",
      "options": { "cwd": "${fileDirname}" },
      "problemMatcher": []
    },
    {
      "label": "terraform: validate",
      "type": "shell",
      "command": "terraform validate",
      "options": { "cwd": "${fileDirname}" },
      "group": { "kind": "build", "isDefault": true },
      "problemMatcher": []
    },
    {
      "label": "terraform: plan",
      "type": "shell",
      "command": "terraform plan",
      "options": { "cwd": "${fileDirname}" },
      "problemMatcher": []
    }
  ]
}
```

The moving parts:

- **`label`** - the name shown in the Run Task list
- **`type: "shell"`** - run the command through your shell (the other common type, `process`, launches an executable directly)
- **`command`** - exactly what you'd have typed in the terminal
- **`options.cwd`** with **`${fileDirname}`** - a [variable](https://code.visualstudio.com/docs/debugtest/tasks#_variable-substitution) meaning "the folder containing the active file"; other useful ones are `${workspaceFolder}` and `${file}`
- **`group.kind: "build"` + `isDefault`** - marks the task as **the default build task**, bound to `Cmd+Shift+B` / `Ctrl+Shift+B`. Making *validate* the default gives you a one-keystroke "is my config sane?" check
- **`problemMatcher`** - parses task output into Problems-panel entries. Matchers are regex-based and built-ins target compilers (`$tsc`, `$eslint-stylish` etc.); there's no built-in Terraform matcher, so we set `[]` to silence the prompt - the Terraform extension's live validation already fills the Problems panel as you type

💡 **Pro Tip**: Anything you find yourself typing more than a few times a day is a task candidate - and because `tasks.json` is committed to the repo, defining it once helps every teammate who opens the folder.

### 💻 **Exercise 6.2**: Author the Terraform Task Set

**Duration**: 20 minutes

1. In your clone of the training repo, create `.vscode/tasks.json` with the content above (via **Tasks: Configure Task** or by creating the file directly)
2. Open `training_essentials/lab_1_creating_resources/main.tf` (any `.tf` file works - it sets `${fileDirname}`)
3. Run **Tasks: Run Task** → **terraform: fmt** - the task terminal opens and formats that lab's directory
4. Press `Cmd+Shift+B` / `Ctrl+Shift+B` - the default build task (`terraform: validate`) runs. Expect `terraform init` to be demanded first for a fresh lab directory: run `terraform init` in the integrated terminal, then run the task again and read its output
5. Break the file (delete a `}`), run validate again, and see the failure in the task terminal; fix the file
6. Optional: add a fourth task `terraform: init` yourself, and re-run the flow init → validate → plan entirely through tasks (plan will prompt for provider variables unless the lab is fully configured - seeing that prompt is itself instructive)
7. Decide with your instructor/team whether to commit `.vscode/tasks.json` or keep it local (this training repo doesn't ship one, so don't push it here)

---

## 🧠 Chapter Quiz

**2 questions** - answers are collapsed below.

1. **What does setting `"group": { "kind": "build", "isDefault": true }` on a task do?**
   - A) Runs the task every time you save a file
   - B) Makes it the default build task, runnable with `Cmd+Shift+B` / `Ctrl+Shift+B`
   - C) Runs the task with administrator rights
   - D) Groups its output with the previous task

2. **In the tasks above, what does `${fileDirname}` resolve to?**
   - A) The repository root, always
   - B) Your home directory
   - C) The directory containing the file currently open in the editor
   - D) The `.vscode` folder

<details>
<summary>🔍 Click for Answers</summary>

1. **B** - The default build task gets the dedicated keybinding; we pointed it at `terraform validate` for a one-keystroke sanity check
2. **C** - Variable substitution: with a lab's `main.tf` open, tasks run in that lab's directory - one task definition serves every lab in the repo

</details>

---

## ✅ Summary

- Tasks wrap repeated commands in a named, shareable, keystroke-launchable definition; output lands in a task terminal
- Auto-detection covers npm/gulp/TypeScript ecosystems; Terraform repos define their own in `.vscode/tasks.json`
- `${fileDirname}` makes one task set serve many lab directories; the default build task binds to `Cmd+Shift+B` / `Ctrl+Shift+B`
- Problem matchers map tool output to the Problems panel - for Terraform, the extension's live diagnostics already cover this

**Next:** [Module 07 - Debugging in VS Code](./module_07_debugging.md) ➡️

## 📚 Additional Resources

- [Tasks documentation](https://code.visualstudio.com/docs/debugtest/tasks)
- [Task variable substitution](https://code.visualstudio.com/docs/debugtest/tasks#_variable-substitution)
- [Terraform CLI commands](https://developer.hashicorp.com/terraform/cli/commands)
