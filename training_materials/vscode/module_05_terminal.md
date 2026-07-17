# ⌨️ Module 05 - Configuring and Using the Terminal

*Duration: 45 minutes | Labs: 3 | Difficulty: 🟢 Beginner*

---

## 🎯 Learning Objectives

By the end of this module, you will be able to:

- ✅ Open, split, and manage multiple integrated terminals
- ✅ Use shell integration features: command decorations, and jumping between commands
- ✅ Configure terminal appearance and behaviour through settings
- ✅ Create custom terminal profiles, including one preconfigured for Terraform debugging

---

## 🖥️ 1. Using the Terminal

The integrated terminal (`` Ctrl+` `` to toggle) is a real shell - zsh on modern macOS, PowerShell on Windows - running inside the Panel. For Terraform work it's where `terraform init/plan/apply` and `git` commands run, right next to the files they act on, and it opens **already `cd`-ed into your workspace folder**.

Essentials:

- **New terminal**: `` Ctrl+Shift+` `` - each terminal appears in the tab list on the right of the Panel
- **Split**: the split icon (or `Cmd+\` / `Ctrl+Shift+5` while focused) puts two shells side by side - e.g. `terraform plan` output in one, editing commands in the other
- **Kill**: the 🗑️ icon ends the shell process
- **Navigate output**: scroll, or `Cmd+F` / `Ctrl+F` to search terminal output - invaluable in a long `terraform plan`
- **Shell integration** decorates each command with a coloured dot (blue = ran, red = failed) and lets you jump between commands with `Cmd+↑/↓` / `Ctrl+↑/↓` - failed-command dots make it trivial to find where a long session went wrong

💡 **Pro Tip**: Clickable paths: `Cmd+click` / `Ctrl+click` any file path in terminal output (like the file/line in a `terraform validate` error) to open it in the editor at that exact location.

**📖 Read the docs:**

- 🔗 [Terminal basics](https://code.visualstudio.com/docs/terminal/basics)
- 🔗 [Getting started with the terminal](https://code.visualstudio.com/docs/terminal/getting-started)

### 💻 **Exercise 5.1**: Work in the Integrated Terminal

**Duration**: 15 minutes

With the training repo open in VS Code:

1. Toggle the terminal with `` Ctrl+` `` and confirm the prompt is in the repo root (`pwd`)
2. Run `git log --oneline -5` and `ls training_essentials/`
3. Create a second terminal with `` Ctrl+Shift+` ``, then split one of them; run `git status` in one pane and browse with `ls` in the other
4. Run a command that fails (e.g. `git checkout does-not-exist`), then a successful one - compare the shell-integration decorations, and jump back to the failed command with `Cmd+↑` / `Ctrl+↑`
5. If you have Terraform installed: `cd training_essentials/lab_1_creating_resources && terraform fmt -check` - then `Cmd+click` / `Ctrl+click` any file path in output. (No Terraform yet? `grep -n "variable" training_essentials/lab_1_creating_resources/main.tf` produces clickable `path:line` output too)
6. Kill the extra terminals when done

---

## 🎚️ 2. Configuring Terminal Options

The terminal is configured through the same settings system as everything else (Module 01) - search `terminal` in the Settings UI to see the full catalogue. The ones worth knowing:

| Setting                                     | What it controls                                        |
| ------------------------------------------- | ------------------------------------------------------- |
| `terminal.integrated.fontSize`              | Terminal font size (independent of the editor's)        |
| `terminal.integrated.fontFamily`            | Font - pick one with good glyph coverage if your prompt uses symbols |
| `terminal.integrated.scrollback`            | Lines kept in the buffer (default 1000 - **raise it**; `terraform plan` output for a large config easily exceeds it) |
| `terminal.integrated.cursorBlinking` / `cursorStyle` | Cursor appearance                              |
| `terminal.integrated.defaultProfile.osx` (`.windows`, `.linux`) | Which shell new terminals launch |
| `terminal.integrated.shellIntegration.enabled` | The command decorations/navigation from lesson 1     |

Example `settings.json` block:

```json
{
  "terminal.integrated.fontSize": 13,
  "terminal.integrated.scrollback": 10000,
  "terminal.integrated.cursorBlinking": true
}
```

**📖 Read the docs:**

- 🔗 [Terminal appearance and settings](https://code.visualstudio.com/docs/terminal/basics)
- 🔗 [Shell integration](https://code.visualstudio.com/docs/terminal/shell-integration)

### 💻 **Exercise 5.2**: Tune the Terminal

**Duration**: 10 minutes

1. Open Settings and search `terminal font size`; adjust it and watch open terminals update
2. Set `terminal.integrated.scrollback` to `10000`
3. Open **Preferences: Open User Settings (JSON)** and confirm both entries
4. Generate long output (`git log`, or `find . -name "*.md"`) and practise `Cmd+F` / `Ctrl+F` search in the terminal
5. Check shell integration is active: **Terminal › Integrated › Shell Integration: Enabled** in settings, and command decorations visible in the terminal

---

## 👤 3. Creating Terminal Profiles

A **profile** is a named terminal configuration: which shell to launch, with what arguments, environment variables, icon, and colour. The profile picker is the `∨` dropdown next to the `+` in the terminal tab bar; **Select Default Profile** sets what plain `` Ctrl+Shift+` `` opens.

Profiles are defined in settings, per OS. Two practical examples for this programme:

```json
{
  "terminal.integrated.profiles.osx": {
    "zsh": {
      "path": "/bin/zsh"
    },
    "terraform-debug": {
      "path": "/bin/zsh",
      "args": ["-l"],
      "env": {
        "TF_LOG": "DEBUG",
        "TF_LOG_PATH": "./terraform-debug.log"
      },
      "icon": "tools",
      "color": "terminal.ansiYellow"
    }
  },
  "terminal.integrated.defaultProfile.osx": "zsh"
}
```

The `terraform-debug` profile launches a shell where every `terraform` command writes verbose logs to `terraform-debug.log` - you'll use exactly this in Module 07. Because the environment variables live only in that profile, normal terminals stay quiet: **open the yellow terminal when you're debugging, close it when you're done**.

(Windows users: the same structure applies under `terminal.integrated.profiles.windows`, with e.g. `"path": "pwsh.exe"`.)

**📖 Read the docs:**

- 🔗 [Terminal profiles](https://code.visualstudio.com/docs/terminal/profiles)

### 💻 **Exercise 5.3**: Build a Terraform Debug Profile

**Duration**: 15 minutes

1. Open the terminal profile dropdown (`∨`) → note your current profiles, and try **Select Default Profile**
2. In `settings.json`, add the `terraform-debug` profile from the example above (adapt `path` for your OS/shell)
3. Open a new terminal *via the dropdown* choosing `terraform-debug` - confirm the icon/colour marks it out, and `echo $TF_LOG` prints `DEBUG`
4. Open a normal terminal alongside and confirm `echo $TF_LOG` prints nothing - the variable is profile-scoped
5. If Terraform is installed: in the debug terminal run `cd training_essentials/lab_1_creating_resources && terraform validate`, and confirm `terraform-debug.log` appears, full of `[DEBUG]` lines. Delete the log file afterwards (and don't commit it!)

---

## 🧠 Chapter Quiz

**3 questions** - answers are collapsed below.

1. **Which keyboard shortcut toggles the integrated terminal?**
   - A) `Cmd+P` / `Ctrl+P`
   - B) `` Ctrl+` ``
   - C) `F5`
   - D) `Cmd+Shift+X` / `Ctrl+Shift+X`

2. **Why raise `terminal.integrated.scrollback` for Terraform work?**
   - A) It makes commands run faster
   - B) Large `terraform plan` outputs can exceed the default 1000-line buffer, losing the top of the plan
   - C) It enables shell integration
   - D) It is required by the HashiCorp extension

3. **What can a terminal profile define that a plain terminal can't?**
   - A) Nothing - profiles are just colour labels
   - B) A specific shell, launch arguments, and environment variables (like `TF_LOG`) applied only to terminals opened with that profile
   - C) Which files are visible in the Explorer
   - D) Git branch protection rules

<details>
<summary>🔍 Click for Answers</summary>

1. **B** - `` Ctrl+` `` toggles the terminal panel; `` Ctrl+Shift+` `` creates a new terminal
2. **B** - Scrollback is the output history buffer; a big plan can scroll the interesting parts out of reach
3. **B** - Profiles bundle shell + args + env + icon/colour, giving you purpose-built terminals like a `TF_LOG` debug shell

</details>

---

## ✅ Summary

- The integrated terminal is a real shell opened at the workspace root; split panes and multiple terminals organise plan-and-edit workflows
- Shell integration adds command decorations and navigation; `Cmd/Ctrl+click` opens file paths from output at the exact line
- Terminal behaviour is plain settings - font, scrollback (raise it), default shell
- Profiles create purpose-built terminals; a `TF_LOG` debug profile keeps verbose logging one dropdown away without polluting normal shells

**Next:** [Module 06 - Using Tasks](./module_06_tasks.md) ➡️

## 📚 Additional Resources

- [Terminal basics](https://code.visualstudio.com/docs/terminal/basics)
- [Terminal profiles](https://code.visualstudio.com/docs/terminal/profiles)
- [Shell integration](https://code.visualstudio.com/docs/terminal/shell-integration)
- [Terraform debugging / TF_LOG](https://developer.hashicorp.com/terraform/internals/debugging)
