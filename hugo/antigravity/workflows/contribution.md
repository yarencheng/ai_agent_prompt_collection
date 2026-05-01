---
description: Step-by-step guide for contributing to Hugo
---

# Hugo Contribution Workflow

Follow these steps to contribute a patch to Hugo:

1. **Environment Setup**:
   * Ensure Go (1.25.0+) and Git are installed.
   * Clone the repository: `git clone https://github.com/gohugoio/hugo.git`.
   * Install dependencies: `go install` and `go install github.com/magefile/mage`.

2. **Branching**:
   * Create a new branch: `git checkout -b <branch-name>`.

3. **Development**:
   * Make changes following the `Hugo Go Best Practices` and `Hugo Theme & Documentation Best Practices` rules.
   * Add tests for new code.
   * Run `go fmt` on your changes.

4. **Validation**:
   * Use `mage -v check` to ensure all tests pass.
   * For local iterations, use `./check.sh ./somepackage/...` or `CI_LOCAL=true ./check.sh ./somepackage/...` for slow tests.
   * To build Hugo with your changes, use `mage hugo`.

5. **Commitment**:
   * Squash your changes into a single commit: `git rebase -i`.
   * Follow `Hugo Git & Contribution Conventions` for the commit message.

6. **Submission**:
   * Sign the CLA.
   * Push to your fork and create a Pull Request.
   * Disclose AI assistance if used.
