---
description: modify workflow_update.md
---

user should input two parameter
1. Name of tool
2. Version of tool

Step 1
* modify and only modify the workflow defined in [NAME]/[VERSION]/workflow-update.md with below steps:
  * read all exist file in rules/**, skills/**, workflows/**
    * merge files if they have duplicated content
    * refactor files if they have overlap content
  * read all reference files in references/**
    * Look for any rules of using [NAME]/[VERSION], and, then, update into rules/**
    * Look for any skills of using [NAME]/[VERSION], and, then, update into skills/**
    * Look for any workflows of using [NAME]/[VERSION], and, then, update into workflows/**

Step 2
* modify and only modify the workflow defined in [NAME]/[VERSION]/workflow-evaluate.md with below steps:
  * (A) read all exist file in rules/**, skills/**, workflows/**
  * (B) read all reference files in references/**
  * Compare the coverage percentage of (A) against (B). For example: 10% means (A) need update; 90% means (A) is almost ready. 