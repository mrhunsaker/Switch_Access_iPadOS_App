# Changes

This file records notable project changes. Planned work must not be described as completed.

## Unreleased

### Added
- Repository-wide consistency and toolchain audit at `docs/repository-audit.md`.
- GitHub Actions Swift formatting workflow with strict linting and an explicit swift-format 604.0.0 version check.
- Documentation maintenance tasks for the audit and a pre-2027-05-05 evaluation of Zensical as the successor to MkDocs Material.

### Changed
- Updated GitHub Actions dependencies to current stable major releases: checkout v7, setup-python v7, upload-pages-artifact v5, and deploy-pages v5.
- Pinned MkDocs Material to 9.8.0 and aligned documentation setup instructions with its Python 3.11+ requirement; documentation CI uses Python 3.12.
- Clarified that the living roadmap and project-status page are authoritative; the original technical roadmap remains a high-level guide.
- Reconciled the three-switch prompt mapping to specify Manual Scanning.
- Fixed escaped newline artifacts in Markdown documentation and consolidated this Unreleased section.

### Verification status
- The prior documentation build/deploy run 42402479023 succeeded before the action-version upgrades. The verification run for the upgraded workflow is pending.
- Swift formatting workflow runs 42402374179, 42402425701, 42402478967, and 42403314021 failed at strict lint on existing source-format violations. Run 42403314021 confirmed that swift-format 604.0.0 installed and passed the version check; source lint then failed. A passing lint run is still required.
- No Xcode build, app runtime test, physical iPad test, physical-switch test, or CVI participatory evaluation was performed as part of this audit.

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

