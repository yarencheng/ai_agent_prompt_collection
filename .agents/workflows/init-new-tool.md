---
description: Initialize a new tool from a template
---

# Parameters
1. Name: Name of the tool (e.g., golang)

# Step 0: Validation
* Check if the directory `[NAME]` already exists.
* If it exists, ask the user if they want to overwrite it before proceeding.

# Step 1: Copy Template
* Identify the template directory in `_template/`.
* Copy all contents from the latest template to `[NAME]`.

# Step 2: Initialize Context
* In all files within `[NAME]`, replace the following placeholders with the actual values:
  * Replace `[NAME]` with the tool name.

# Step 3: Finalize Setup
* Trigger the `update-tool` workflow with the same Name to ensure the tool's workflows and rules are fully optimized.
