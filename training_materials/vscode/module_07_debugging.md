# 🐞 Module 07 - Debugging in VS Code

*Duration: 45 minutes | Labs: 3 | Difficulty: 🟡 Intermediate*

---

## 🎯 Learning Objectives

By the end of this module, you will be able to:

- ✅ Use the Run and Debug view: breakpoints, stepping, variable inspection, and the watch list
- ✅ Read and author a `launch.json` debug configuration
- ✅ Apply the equivalent "debugging" toolkit to Terraform: validate, `terraform console`, `TF_LOG`, and the Problems panel

> [!Note]
> The classic VS Code course teaches this chapter with the built-in Node.js debugger. This programme adapts it: Jamf engineers ship **shell scripts** (see `training_essentials/lab_3_fixing_problems/scripts/`), so we debug one of those - and because Terraform is declarative, its "debugger" is a different toolkit, covered in lesson 3.

---

## 🔬 1. The Debugging UI

A debugger lets you **pause a running program** and look around - instead of sprinkling `echo`/`print` statements and re-running. The concepts are identical in every language; only the debugger extension changes (Module 02):

| Concept          | What it is                                                            |
| ---------------- | --------------------------------------------------------------------- |
| **Breakpoint**   | A marker (click in the gutter left of the line number) where execution pauses |
| **Continue** `F5` | Run until the next breakpoint                                        |
| **Step Over** `F10` | Execute the current line, pause on the next                        |
| **Step Into** `F11` | Follow execution *into* a function call                            |
| **Step Out** `Shift+F11` | Finish the current function, pause in the caller              |
| **Variables pane** | Live values of everything in scope at the pause point               |
| **Watch pane**   | Expressions you pin, re-evaluated at every pause                      |
| **Debug Console** | A REPL evaluated in the paused program's context                     |

The **Run and Debug view** (`Cmd+Shift+D` / `Ctrl+Shift+D`) hosts all of this, and the debug toolbar (continue/step/restart/stop) appears at the top of the window while a session runs.

**📖 Read the docs:**

- 🔗 [Debugging](https://code.visualstudio.com/docs/debugtest/debugging)

### 💻 **Exercise 7.1**: Debug a Shell Script

**Duration**: 15 minutes

Jamf workflows lean on bash, so we'll debug bash. Install the **Bash Debug** extension (`rogalmic.bash-debug`; requires bash 4+ - macOS users: `brew install bash`).

1. Create a practice folder with a script that has a real (if tiny) logic bug:

   ```bash
   #!/bin/bash
   # check_macos_build.sh - report whether this Mac needs an OS update
   current_version=$(sw_vers -productVersion)
   required_version="15.0"

   if [[ "$current_version" > "$required_version" ]]; then
     echo "OK: $current_version meets requirement"
   else
     echo "UPDATE NEEDED: $current_version < $required_version"
   fi
   ```

   (The bug: `>` compares *strings*, so version `9.1` would sort above `15.0`. Seeing is believing - so let's watch it happen.)
2. Open the Run and Debug view → **Run and Debug** → choose **Bash Debug** → **Debug bash script** and select the script when prompted
3. Set a breakpoint on the `if` line, start debugging (`F5`), and inspect `current_version` and `required_version` in the **Variables** pane at the pause
4. Add `"$current_version" > "$required_version"` to the **Watch** pane; step over the comparison with `F10` and watch which branch executes
5. Change `required_version` to `"9.0"` and debug again to see string comparison betray you, then stop the session (`Shift+F5`)

---

## ⚙️ 2. Creating Launch Configurations

Clicking through "choose a debugger, choose a script" every time gets old. A **launch configuration** - `.vscode/launch.json` - records *how to start a debug session* so `F5` just works. Run and Debug view → **create a launch.json file** scaffolds it.

Anatomy, using a bash configuration for the script from Exercise 7.1:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "bashdb",
      "request": "launch",
      "name": "Debug check_macos_build",
      "program": "${workspaceFolder}/check_macos_build.sh",
      "args": []
    }
  ]
}
```

- **`type`** - which debugger extension handles it (`bashdb`, `node`, `python`, ...)
- **`request`** - `launch` (start the program under the debugger) vs `attach` (connect to something already running)
- **`name`** - what shows in the dropdown at the top of the Run and Debug view
- **`program` / `args`** - what to run, using the same `${workspaceFolder}`-style variables as tasks (Module 06)
- Multiple configurations coexist in the list; **compound** configurations can launch several at once

Like `tasks.json`, `settings.json`, snippets, and extension recommendations, `launch.json` lives in `.vscode/` and can ship with the repo - the complete "editor as code" set.

**📖 Read the docs:**

- 🔗 [Debug configurations](https://code.visualstudio.com/docs/debugtest/debugging-configuration)

### 💻 **Exercise 7.2**: Make `F5` Do the Work

**Duration**: 10 minutes

1. In your practice folder, create `.vscode/launch.json` with the configuration above
2. Confirm the configuration name appears in the Run and Debug view's dropdown
3. Press `F5` - the script starts under the debugger with no prompts
4. Add a second configuration (e.g. duplicate it with different `args`, or - if you have Node or Python installed - a config debugging a one-line script in that language) and switch between the two in the dropdown
5. Note how `request`, `type`, and `program` map onto what you did manually in Exercise 7.1

---

## 🏗️ 3. "Debugging" Terraform

Terraform is declarative - there's no stepping through `resource` blocks line by line, so there's no breakpoint debugger for `.tf` files. The equivalent toolkit, in the order you should reach for it:

**1. The Problems panel + Terraform extension** - your always-on first line. Schema and syntax errors appear as you type, before any command runs.

**2. `terraform validate`** - the CLI check that CI will run; you wired it to `Cmd+Shift+B` / `Ctrl+Shift+B` in Module 06.

**3. `terraform plan`** - not just a deploy gate: it's where you *test hypotheses* about what your change really does.

**4. `terraform console`** - the closest thing to a debugger's REPL/watch pane. It evaluates expressions against your config and state:

```console
$ terraform console
> var.jamfpro_instance_fqdn
> upper("hello")
> jsonencode({ name = "test" })
```

**5. `TF_LOG`** - verbose execution logs when behaviour (not syntax) is the mystery - provider API calls, auth failures, timeouts. You built a dedicated `terraform-debug` terminal profile for exactly this in Module 05:

```bash
TF_LOG=DEBUG TF_LOG_PATH=./terraform-debug.log terraform plan
```

Levels run `TRACE` > `DEBUG` > `INFO` > `WARN` > `ERROR`. Read the log in VS Code and use search (`Cmd+F` / `Ctrl+F`) - and never commit it: logs can contain sensitive request data.

**📖 Read the docs:**

- 🔗 [Terraform debugging](https://developer.hashicorp.com/terraform/internals/debugging)
- 🔗 [terraform console](https://developer.hashicorp.com/terraform/cli/commands/console)

### 💻 **Exercise 7.3**: The Terraform Troubleshooting Loop

**Duration**: 15 minutes

Requires Terraform installed; work in a copy of `training_essentials/lab_1_creating_resources`:

1. Run `terraform init`, then introduce a *schema* error (e.g. misspell `description` as `descriptionn` inside a variable block). Watch the Problems panel flag it instantly; note that `terraform validate` catches the same thing - the panel just got there first. Fix it
2. Open `terraform console` and evaluate a few expressions: a `var.` reference (it will prompt/error for unset variables - informative in itself), a function like `timestamp()`, and string interpolation
3. Open your `terraform-debug` terminal profile (Module 05) - or export `TF_LOG=DEBUG TF_LOG_PATH=./terraform-debug.log` manually - and run `terraform validate`
4. Open `terraform-debug.log`, search for `[DEBUG]`, and skim what Terraform does even for a validate: provider schema loading, plugin startup
5. Delete the log file. Reflect: which of the five tools would you reach for if (a) a resource attribute is rejected, (b) an expression returns the wrong value, (c) `apply` hangs talking to Jamf Pro? *(Answers: a → Problems/validate, b → console, c → TF_LOG)*

---

## 🧠 Chapter Quiz

**2 questions** - answers are collapsed below.

1. **What is the difference between Step Over (`F10`) and Step Into (`F11`)?**
   - A) Step Over skips the line entirely without running it; Step Into runs it
   - B) Step Over executes the line and pauses on the next; Step Into follows execution inside a function call on that line
   - C) They are identical
   - D) Step Into restarts the program

2. **Why is there no breakpoint debugger for `.tf` files, and what replaces it?**
   - A) HashiCorp hasn't finished it yet; wait for an update
   - B) Terraform is declarative - you don't step through desired state; instead you use validate, plan, `terraform console`, and `TF_LOG`
   - C) Breakpoints only work on Windows
   - D) The Bash Debug extension handles `.tf` files

<details>
<summary>🔍 Click for Answers</summary>

1. **B** - Both execute the current line; they differ in whether you descend into function calls or stay at the current level
2. **B** - Declarative config has no execution flow to pause; the Terraform toolkit answers the same questions (what's the value? what will happen? why did it fail?) by different means

</details>

---

## ✅ Summary

- The debug UI - breakpoints, stepping, Variables/Watch, Debug Console - is universal; debugger extensions plug languages into it
- `launch.json` records how to start a session so `F5` just works; it's part of the same shareable `.vscode/` family as tasks and settings
- Terraform's "debugger" is a toolkit: Problems panel and `validate` for correctness, `plan` for hypotheses, `console` for expressions, `TF_LOG` for behaviour - each mapping to a debugger concept you now know

**Next:** [Module 08 - Continue Your Learning Journey](./module_08_conclusion.md) ➡️

## 📚 Additional Resources

- [Debugging in VS Code](https://code.visualstudio.com/docs/debugtest/debugging)
- [Debug configuration reference](https://code.visualstudio.com/docs/debugtest/debugging-configuration)
- [Terraform debugging internals](https://developer.hashicorp.com/terraform/internals/debugging)
