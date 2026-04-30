---
description: Initialize a new tool from a template
---

# Parameters
1. Name: Name of the tool (e.g., golang)
2. Version: Version of the tool (e.g., 1.22)

# Step 0: Validation
* Check if the directory `[NAME]/[VERSION]` already exists.
* If it exists, ask the user if they want to overwrite it before proceeding.

# Step 1: Copy Template
* Identify the latest version directory in `_template/`.
* Copy all contents from the latest template to `[NAME]/[VERSION]`.

# Step 2: Initialize Context
* In all files within `[NAME]/[VERSION]`, replace the following placeholders with the actual values:
  * Replace `[NAME]` with the tool name.
  * Replace `[VERSION]` with the tool version.

# Step 3: Finalize Setup
* Trigger the `update-tool` workflow with the same Name and Version to ensure the tool's workflows and rules are fully optimized.
