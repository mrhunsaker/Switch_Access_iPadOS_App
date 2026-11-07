# LLM-assisted development and project-tracking workflow

The repository includes a structured prompt library at [`prompts/switchplay_cvi_llm_prompts.json`](https://github.com/mrhunsaker/Switch_Access_iPadOS_App/blob/main/prompts/switchplay_cvi_llm_prompts.json).

## Required first prompt: P00

Run **P00 — Project-wide documentation, stage, and completion tracker** at the beginning and end of every meaningful LLM work session. P00 is the controlling instruction for repository inspection, task tracking, stage gates, documentation synchronization, manual verification, and handoff. Run it before a narrower prompt such as P04 or P08, and run it again after implementation so the records reflect the actual result.

P00 requires the LLM to inspect the current repository rather than rely on chat history or an earlier summary. It must reconcile the README, roadmap, status page, change log, repository audit, detailed documentation, source, tests, configuration, workflows, and relevant commits.

## Mandatory status vocabulary

Use these states consistently:

| Status | Meaning |
| --- | --- |
| `NOT_STARTED` | No work is evidenced. |
| `IN_PROGRESS` | Work has started but is not ready for verification. |
| `IMPLEMENTED_UNVERIFIED` | The artifact exists, but required validation has not passed. |
| `AWAITING_USER_VERIFICATION` | A manual human/device/participant check is required. |
| `BLOCKED` | A prerequisite prevents progress; name the blocker. |
| `VERIFIED_COMPLETE` | Acceptance criteria passed and evidence is recorded. |
| `DEFERRED` | Intentionally postponed with a reason or revisit condition. |

**Implemented does not mean complete.** A source file being committed does not prove it builds. A successful build does not prove it runs correctly. Simulator testing does not prove physical switch compatibility. Physical switch testing does not replace participatory evaluation with people with varied CVI characteristics.

## Who marks work complete?

The LLM may update implementation tasks when repository evidence supports the change. The LLM must not self-certify checks that require the user's iPad, Mac, physical switches, external account, human judgment, or participant evaluation.

For each manual check, the LLM must:
1. Set the task to `AWAITING_USER_VERIFICATION` or `BLOCKED`.
2. Add a visible **USER ACTION REQUIRED** section to the status documentation or task handoff.
3. Give exact instructions: where to go, what to do, what result to observe, and what evidence to report.
4. Identify the exact task ID and roadmap checkbox.
5. Leave that checkbox unchecked until the user explicitly reports completion and the required evidence is recorded.
6. If the report is incomplete, ask for the missing evidence and keep the task unverified.

The user is the completion authority for user-owned manual checks. Do not infer completion from silence, elapsed time, code, screenshots that do not show the required behavior, or an LLM-generated test report.

### Example of a manual verification handoff

**USER ACTION REQUIRED — ST0-06: Build, install, and launch on a physical iPad**

- **Where:** On a Mac, open the generated Xcode project in Xcode.
- **Action:** Select the connected iPad, build, install, and launch SwitchPlay.
- **Pass condition:** The app installs and launches without a build or launch failure.
- **Report back:** Pass/fail; Xcode version; iPad model; iPadOS version; tested commit; and the full error text or screenshot if it fails.
- **Completion rule:** Keep the roadmap checkbox unchecked and status at `AWAITING_USER_VERIFICATION` until the user reports the result and evidence is added to the status record.

## Required tracking records

Every roadmap task must have a stable ID, description, status, and owner. Before a task enters `IN_PROGRESS`, define its dependencies, acceptance criteria, and verification method. When work starts, record evidence, last-updated date, and next action, and keep them current through completion or deferral. For `NOT_STARTED` tasks, stage-level dependencies and exit criteria may be used until the task is prioritized, but acceptance criteria must be explicit before implementation begins. The project-status page is a concise summary and may group task IDs when their status and owner match; do not let a grouped row conceal different acceptance criteria or verification results. Every stage must have a status, task IDs, exit criteria, exit evidence, blockers, and next action.

Maintain:
- **`docs/roadmap.md`:** planned work, stable task IDs, dependencies, acceptance criteria, and unchecked completion boxes.
- **`docs/project-status.md`:** authoritative current state, stage summary, task tracker, evidence, blockers, and user action queue.
- **`CHANGES.md`:** chronological record of meaningful changes.
- **`README.md`:** concise, accurate project summary and links.
- **Detailed docs:** current technical instructions, design requirements, testing procedures, and known limitations.
- **Prompt library:** shared rules and specialized prompts.

Update all affected records in the same change. Do not create contradictory status statements. Preserve historical failures, defects, and decisions; mark superseded information instead of silently deleting it. Record the repository commit for each reconciled status snapshot when available.

## Recommended prompt sequence

1. **P00** — Reconcile project state and establish the next task.
2. **P01** — CVI-centered product requirements.
3. **P02** — Individualized visual-accessibility architecture.
4. **P10** — Participatory design and user research.
5. **P03** — Visual design and interface audit.
6. **P04** — Native Switch Control implementation review.
7. **P05 / P06** — Activity and feedback design.
8. **P11** — Individual customization.
9. **P07** — Music activities.
10. **P08 / P09** — Code review and acceptance testing.
11. **P12–P14** — Documentation, regression, and evidence review.

Run P00 again after each substantial work session and before declaring a stage complete.

## Session handoff format

Every LLM work session should end with:
1. Overall project stage and status.
2. Stage-by-stage progress and task IDs changed.
3. Files updated and why.
4. Validation actually run, with exact outcomes; list checks not run.
5. USER ACTION REQUIRED steps, with exact task IDs and report-back evidence.
6. Blockers, unresolved decisions, and dependencies.
7. The single next actionable task.

Do not claim a build, deployment, device test, user study, or manual check succeeded unless the result was actually observed and documented.

## Swift code consistency

All Swift changes must follow the repository-root [CODE_STYLE.md](https://github.com/mrhunsaker/Switch_Access_iPadOS_App/blob/main/CODE_STYLE.md) and checked-in [.swift-format configuration](https://github.com/mrhunsaker/Switch_Access_iPadOS_App/blob/main/.swift-format). Use the project-pinned `swift-format` 604.0.0 release (as of 2026-11-07), and run `swift-format lint --strict --recursive SwitchPlay`. CI verifies the installed formatter version before linting. Keep style validation distinct from compilation and device testing. The `Swift formatting` GitHub Actions workflow runs this strict check on every pull request and push to `main`. Historical runs 42402374179, 42402425701, and 42402478967 failed at strict lint because existing source does not meet the checked-in formatting rules; earlier runs used the Xcode-bundled Swift-format 6.3.0. Latest runs 42403314021, 42403378523, and 42403419130 confirmed that Homebrew installed and version-checked swift-format 604.0.0, then failed on source indentation, line-length, and trailing-comma diagnostics. Do not weaken the lint gate to hide diagnostics; format the source, rerun the workflow, and keep CI-01 open until a green run is recorded. P00 and P08 enforce this standard for LLM-assisted work.\n\n## Repository discipline

Inspect existing files before editing. Review generated code and documentation like any other contribution. Do not provide private participant information to a model. Do not commit changes unless explicitly authorized. Keep the roadmap and [current status](project-status.md) synchronized with actual evidence.

## SwitchPlay-specific non-negotiables

- Native SwiftUI iPadOS application using Apple's system-wide Switch Control; no app-specific scanning engine or cursor.
- The app cannot pair switches, assign system actions, or inspect iPadOS Switch Control settings.
- Validate one-switch Auto Scanning, two-switch Manual Scanning, and three-switch Manual Scanning separately.
- Keep the app's Back navigation separate from the system Move to Previous Item action.
- Use native accessibility semantics; do not make drag-and-drop the only interaction.
- CVI is heterogeneous. Never present a universal CVI mode or assume one color, contrast, layout, or sensory configuration works for everyone.
- Do not claim switch compatibility, CVI accessibility, clinical benefit, or learning outcomes without appropriate evidence and testing.
