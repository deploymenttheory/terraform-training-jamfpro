# 🔀 Module 04 - Integrating with Source Control

*Duration: 45 minutes | Labs: 3 | Difficulty: 🟢 Beginner*

---

## 🎯 Learning Objectives

By the end of this module, you will be able to:

- ✅ Initialise a Git repository and stage, review, and commit changes from the Source Control view
- ✅ Publish a repository to GitHub and sync (push/pull) from within VS Code
- ✅ Create and switch branches from the Status Bar
- ✅ Resolve merge conflicts confidently using the merge editor

> [!Tip]
> This module teaches the **VS Code workflow** for Git. The underlying concepts - commits, branches, remotes, why any of this matters for infrastructure - are covered in the [Git training modules](../git/module_01_git_github_overview.md) and the [Git tutorial](../git/1.1.0_git_tutorial.md). Everything you can do here, you can also do with the `git` CLI; the GUI and CLI are two views of the same repository, and good engineers use both.

---

## 📦 1. Initializing a Repository and Managing Changes

The **Source Control view** (`Ctrl+Shift+G`) is Git's home in VS Code. In a folder that isn't yet a repository, it offers **Initialize Repository** - the equivalent of `git init`.

Once a repo exists, the everyday loop looks like this:

1. **Edit files** - modified files get an `M` badge in the Explorer, new files a `U` (untracked); the Source Control icon shows a change count
2. **Review the diff** - click a changed file in the Source Control view to see a side-by-side diff of working tree vs last commit. *Always read the diff before committing* - for Terraform this is your first "what will change?" review, before `terraform plan` even runs
3. **Stage** - the `+` icon moves a file to **Staged Changes** (`git add`). You can stage individual files, or even selected lines from the diff view (right-click → **Stage Selected Ranges**)
4. **Commit** - type a message in the box and press `Cmd+Enter` / `Ctrl+Enter` (`git commit`)
5. **Discard** - the ↩️ icon on a change reverts it (`git restore`) - handy after practice exercises

With **GitLens** (installed in Module 02) you also get inline blame - hover any line to see the commit that last touched it.

**📖 Read the docs:**

- 🔗 [Source control overview](https://code.visualstudio.com/docs/sourcecontrol/overview)
- 🔗 [Staging and committing](https://code.visualstudio.com/docs/sourcecontrol/staging-commits)

### 💻 **Exercise 4.1**: The Edit-Stage-Commit Loop

**Duration**: 15 minutes

Work in a brand-new practice repo so you can't disturb the training materials:

1. Create a folder and open it: `mkdir ~/vscode-git-practice && code ~/vscode-git-practice`
2. In the Source Control view, click **Initialize Repository**
3. Create `main.tf` with a minimal block:

   ```hcl
   terraform {
     required_version = ">= 1.5.0"
   }
   ```

4. Watch the file appear under **Changes** with a `U` badge; click it to view the diff, stage it with `+`, and commit with the message `feat: initial terraform scaffold`
5. Edit the file (change the version to `">= 1.6.0"`), view the diff - note old vs new side by side - then stage and commit as `chore: bump required terraform version`
6. Make a third edit, then practise **discarding** it with the ↩️ icon instead of committing

---

## ☁️ 2. Working with Remotes

A local repository becomes shareable when it has a **remote** - almost always GitHub in this programme.

- **Publish**: for a repo with no remote, the Source Control view (and Status Bar cloud icon) offers **Publish Branch**. The first time, VS Code walks you through GitHub authentication, then creates the remote repository for you
- **Sync**: after that, the Status Bar shows a sync indicator with arrows and counts - `1↑` means one commit to push, `2↓` two to pull. Clicking it runs pull-then-push. The `...` menu in Source Control exposes **Push**, **Pull**, and **Fetch** individually
- **Clone**: Command Palette → **Git: Clone** takes a URL and does what `git clone` does
- **Branches**: the branch name sits in the bottom-left of the Status Bar. Click it to switch branches or create a new one - the habit to build is *glance before you commit*: am I on the branch I think I'm on?

⚠️ **Important**: In real infrastructure work you'll rarely commit straight to `main` - changes flow through branches and pull requests, as covered in [Working with GitHub](../git/module_04_working_with_github.md). The GitHub Pull Requests extension can bring PR review into VS Code, but the website works fine too.

**📖 Read the docs:**

- 🔗 [Repositories and remotes](https://code.visualstudio.com/docs/sourcecontrol/repos-remotes)
- 🔗 [Working with GitHub in VS Code](https://code.visualstudio.com/docs/sourcecontrol/github)

### 💻 **Exercise 4.2**: Publish and Sync

**Duration**: 10 minutes

Continuing in `~/vscode-git-practice`:

1. Click **Publish Branch** and sign in to GitHub when prompted; publish as a **private** repository
2. Open the repository on github.com and confirm both commits are there
3. On github.com, edit `main.tf` directly in the browser (add a comment line) and commit - this simulates a teammate's change
4. Back in VS Code, click the sync indicator in the Status Bar and confirm the change arrives locally
5. Click the branch name in the Status Bar → **Create new branch** → name it `practice/branching`; make a commit on it, then switch back to `main` and note the file content changes with the branch

---

## ⚔️ 3. Resolving Merge Conflicts

A merge conflict happens when two branches change the same lines and Git can't choose for you. In Terraform teams this is routine - two people editing the same resource block - so treat conflict resolution as a normal skill, not an emergency.

When a merge hits a conflict, VS Code marks the conflicted files in the Source Control view under **Merge Changes**, and offers two ways to resolve:

- **Inline**: conflicted regions show `<<<<<<<` / `=======` / `>>>>>>>` markers with CodeLens actions: **Accept Current Change**, **Accept Incoming Change**, **Accept Both**, **Compare Changes**
- **Merge editor**: click **Resolve in Merge Editor** for a three-pane view - *Incoming* (theirs) on one side, *Current* (yours) on the other, and the **Result** below. Tick the checkboxes to take either or both sides, or type directly into the Result pane

Once every conflict is resolved, mark the file resolved (stage it) and complete the merge with a commit.

💡 **Pro Tip**: The right resolution is sometimes *neither* side verbatim - for HCL it must also be **valid and correct**. After resolving conflicts in `.tf` files, run `terraform fmt` and `terraform validate` before you commit the merge.

**📖 Read the docs:**

- 🔗 [Resolve merge conflicts](https://code.visualstudio.com/docs/sourcecontrol/merge-conflicts)

### 💻 **Exercise 4.3**: Manufacture and Resolve a Conflict

**Duration**: 15 minutes

Continuing in `~/vscode-git-practice` (on branch `main`):

1. Ensure `main.tf` contains a line like `required_version = ">= 1.6.0"`
2. Create a branch `conflict/a` from `main`; on it, change the line to `">= 1.7.0"` and commit
3. Switch back to `main`; change the *same line* to `">= 1.6.5"` and commit
4. Merge the branch: Command Palette → **Git: Merge...** → choose `conflict/a`. VS Code reports a conflict
5. Open the conflicted file and try the **inline** CodeLens actions first (then `Cmd+Z` / `Ctrl+Z` to un-choose)
6. Now click **Resolve in Merge Editor**: review Incoming vs Current, tick a side (or combine), and inspect the Result pane
7. Click **Complete Merge**, then stage and commit the merge
8. Verify: the Source Control graph/log (or `git log --oneline --graph` in the terminal) shows the merge commit joining both branches

---

## 🧠 Chapter Quiz

**3 questions** - answers are collapsed below.

1. **What does clicking `+` on a file in the Source Control view do?**
   - A) Commits the file immediately
   - B) Stages the file (`git add`) so it's included in the next commit
   - C) Pushes the file to GitHub
   - D) Deletes the file

2. **The Status Bar sync indicator shows `2↑ 1↓`. What does it mean?**
   - A) 2 files modified, 1 file deleted
   - B) 2 branches local, 1 branch remote
   - C) 2 local commits to push, 1 remote commit to pull
   - D) 2 merge conflicts, 1 resolved

3. **In the merge editor, what are the three panes?**
   - A) Past, present, and future versions
   - B) Incoming (theirs), Current (yours), and the combined Result
   - C) Staged, unstaged, and untracked files
   - D) Local, remote, and stash

<details>
<summary>🔍 Click for Answers</summary>

1. **B** - Staging builds up the snapshot for the next commit; nothing is committed until you write a message and commit
2. **C** - The arrows count commits out of sync with the remote; clicking runs pull then push
3. **B** - You choose from Incoming and Current via checkboxes (or type directly) to produce the Result

</details>

---

## ✅ Summary

- The Source Control view wraps the everyday Git loop: review diff → stage → commit, with **Initialize Repository** for new folders
- **Publish Branch** creates the GitHub remote for you; the Status Bar sync indicator handles push/pull, and the branch name in the Status Bar is your pre-commit sanity check
- Merge conflicts are routine: resolve inline for simple cases, in the merge editor for anything real - and `terraform validate` the result before committing
- The GUI and the `git` CLI are interchangeable views of the same repo; concepts live in the [Git course](../git/module_01_git_github_overview.md)

**Next:** [Module 05 - Configuring and Using the Terminal](./module_05_terminal.md) ➡️

## 📚 Additional Resources

- [Source control in VS Code](https://code.visualstudio.com/docs/sourcecontrol/overview)
- [Branches and worktrees](https://code.visualstudio.com/docs/sourcecontrol/branches-worktrees)
- [GitHub in VS Code](https://code.visualstudio.com/docs/sourcecontrol/github)
- [This programme's Git tutorial](../git/1.1.0_git_tutorial.md)
