# Changes

This file records notable project changes. Planned work must not be described as completed.

## Unreleased

### Added
- CVI-focused LLM development prompt library in `prompts/switchplay_cvi_llm_prompts.json`.
- MkDocs Material documentation source and GitHub Actions Pages publishing workflow.
- Living project goals, status, roadmap, accessibility principles, development setup, and LLM workflow documentation.
- Contribution, community conduct, and security policies.

### Status
- The SwiftUI prototype remains an uncompiled starter until built with Xcode on macOS.
- No physical iPad or external-switch validation is claimed.
- GitHub Pages publication requires the repository Pages source to be set to **GitHub Actions**.

## Updating this file
Add a dated or versioned section near the top for each meaningful change. Summarize features, accessibility changes, fixes, documentation changes, and known limitations. Keep implementation status accurate.

## 2026-11-07 — Swift contributor standards

- Added CODE_STYLE.md with Swift and SwiftUI naming, architecture, error handling, concurrency, audio, accessibility, documentation, and testing conventions.
- Added the repository-wide .swift-format configuration (2-space indentation, 100-character line target, import organization, and consistent declaration formatting).
- Linked the standard from the README, contributor guide, and MkDocs navigation.
- Updated the LLM prompt library so P00 and code-review prompt P08 enforce the same style standard.
- No Swift source was reformatted, compiled, or linted as part of this documentation/configuration change.

## 2026-11-07

- Added P00, a mandatory project-wide LLM prompt for repository reconciliation, stable task IDs, stage tracking, documentation synchronization, and evidence-based completion.
- Defined explicit task statuses and required task/stage metadata.
- Established user-owned manual verification gates: the LLM must leave checkboxes unchecked until the user confirms completion and provides evidence.
- Updated the LLM workflow, roadmap, and project status with stage tracking and exact next actions.
- No app build, physical-device test, switch-hardware test, or CVI participant evaluation was performed as part of this documentation update.

