# Google Antigravity Best Practices Checklist

When creating or updating Antigravity components, use this checklist to ensure high quality and consistency.

## 🎯 Focus & Scope
- [ ] Does the component have a single, clearly defined purpose?
- [ ] Is it named descriptively?
- [ ] Does it avoid overlapping with existing skills or rules?

## 📝 Documentation (SKILL.md, Rules, Workflows)
- [ ] Is the metadata (Name, Description, Trigger) complete and accurate?
- [ ] Are the instructions actionable and clear?
- [ ] Does it use standard Markdown formatting?
- [ ] Are there examples of usage?

## 🛠 Scripts
- [ ] Are scripts located in the `scripts/` directory?
- [ ] Are they executable (`chmod +x`)?
- [ ] Do they support a `--help` flag?
- [ ] Are they modular and reusable?
- [ ] Do they handle errors gracefully?

## 📏 Rules
- [ ] Is the trigger appropriate (e.g., `always_on`, or specific file patterns)?
- [ ] Is the rule enforceable and objective?
- [ ] Does it provide clear "Correct" and "Incorrect" examples if applicable?

## 🔄 Workflows
- [ ] Are the steps logical and sequential?
- [ ] Are manual vs. automated steps clearly distinguished?
- [ ] Is the expected outcome of each step defined?
