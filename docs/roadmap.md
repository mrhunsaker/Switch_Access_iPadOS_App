# Development roadmap

**Tracking rule:** Every task must have a stable ID and a status in `docs/project-status.md`. A checked box means the required acceptance criteria and evidence are complete—not merely that code was written. Tasks requiring a Mac, physical iPad, physical switches, human judgment, or participant feedback are user-owned verification gates. The LLM must leave those boxes unchecked and list exact instructions under **USER ACTION REQUIRED** until the user confirms the result and evidence is recorded. See [LLM workflow](llm-workflow.md).

**Status vocabulary:** `NOT_STARTED`, `IN_PROGRESS`, `IMPLEMENTED_UNVERIFIED`, `AWAITING_USER_VERIFICATION`, `BLOCKED`, `VERIFIED_COMPLETE`, `DEFERRED`.

This is the living forward plan. It extends the original [technical roadmap](DEVELOPMENT_ROADMAP.md) and prioritizes CVI-centered accessibility before feature expansion.

## Stage 0 — Establish a native build
- [ ] **ST0-01** — Obtain access to a Mac with supported Xcode.
- [ ] **ST0-02** — Install Xcode and complete first-launch setup.
- [ ] **ST0-03** — Install XcodeGen and clone the repository.
- [ ] **ST0-04** — Generate and open the Xcode project.
- [ ] **ST0-05** — Set a unique bundle identifier and configure signing.
- [ ] **ST0-06** — Build, install, and launch on a physical iPad.
- [ ] **ST0-07** — Resolve compiler and launch issues.

**Exit evidence:** successful build and launch recorded with Xcode version, iPad model, iPadOS version, and tested commit.

## Stage 1 — Verify the existing prototype
- [ ] **ST1-01** — Test home navigation with touch.
- [ ] **ST1-02** — Test matching, reset, and status feedback.
- [ ] **ST1-03** — Test piano notes and Stop sound.
- [ ] **ST1-04** — Test one-switch Auto Scanning.
- [ ] **ST1-05** — Test two-switch Manual Scanning.
- [ ] **ST1-06** — Test three-switch Manual Scanning.
- [ ] **ST1-07** — Document scan order, focus stops, missed activations, and audio behavior.

**Exit evidence:** completed acceptance checklist and reproducible physical-device test record. Do not claim switch compatibility before this stage passes.

## Stage 2 — Define and implement the CVI accessibility foundation
- [ ] **CVI-01** — Review requirements with people with CVI and relevant practitioners.
- [ ] **CVI-02** — Define a modular visual customization model.
- [ ] **CVI-03** — Evaluate independent settings for color, contrast, object size, spacing, choice count, visual boundaries, text, animation, and timing.
- [ ] **CVI-04** — Define predictable layouts without assuming one visual profile.
- [ ] **CVI-05** — Establish feedback, timing, and error-recovery conventions.
- [ ] **CVI-06** — Establish reusable SwiftUI accessibility patterns.
- [ ] **CVI-07** — Define privacy-conscious participatory testing methods.

**Exit evidence:** documented requirements, design rationale, prototype settings, and feedback from people with varied CVI characteristics.

## Stage 3 — Core activities
- [ ] **ACT-01** — Cause and effect.
- [ ] **ACT-02** — Configurable matching.
- [ ] **ACT-03** — Memory.
- [ ] **ACT-04** — Sequencing.
- [ ] **ACT-05** — Select-piece/select-destination puzzles.
- [ ] **ACT-06** — Creative activities.

Each activity must have acceptance criteria, accessible interaction paths, and test results before being called complete.

## Stage 4 — Music experiences
- [ ] **MUS-01** — Piano improvements and configurable layout.
- [ ] **MUS-02** — Drums and soundboard.
- [ ] **MUS-03** — Simple composer with discrete controls.
- [ ] **MUS-04** — Prerecorded music player with accessible transport controls.
- [ ] **MUS-05** — Audio volume, stop behavior, interruptions, and route-change testing.

## Stage 5 — Personalization and reliability
- [ ] **PER-01** — Persistent individual settings and preview.
- [ ] **PER-02** — Adjustable activity complexity and choice count.
- [ ] **PER-03** — Adjustable feedback and audio preferences.
- [ ] **PER-04** — Privacy-preserving session progress, if useful.
- [ ] **PER-05** — Interruption and lifecycle handling.
- [ ] **PER-06** — Localization and further accessibility evaluation.

## Stage 6 — Field evaluation and release readiness
- [ ] **REL-01** — Participatory usability testing with appropriate consent and safeguards.
- [ ] **REL-02** — Evaluate varied CVI characteristics, motor access patterns, and switch hardware.
- [ ] **REL-03** — Review fatigue, independence, predictability, errors, and preference—not speed alone.
- [ ] **REL-04** — Resolve critical accessibility defects.
- [ ] **REL-05** — Verify public claims against evidence.
- [ ] **REL-06** — Publish known limitations and release documentation.

## Contributor engineering checks
- [x] **CI-01** — Verify the Swift formatting GitHub Actions workflow on a pull request or manual dispatch; resolve diagnostics and document the passing run.

**Acceptance criteria met:** all five Swift source files were reformatted using the checked-in `.swift-format` configuration. The pinned swift-format 604.0.0 GitHub Actions run [42404181569](https://github.com/mrhunsaker/Switch_Access_iPadOS_App/actions/runs/42404181569) passed strict recursive lint. This check is separate from Xcode compilation and all device/accessibility validation.

## Documentation and toolchain maintenance
- [x] **DOC-01** — Reconcile repository requirements, documentation, prompts, and toolchain versions.
- [ ] **DOC-02** — Evaluate migration from MkDocs Material to Zensical before the upstream Material end-of-life date (2027-05-05).

**DOC-01 acceptance criteria:** `docs/repository-audit.md` records the audit scope, resolved contradictions, current official tool versions, deliberate compatibility decisions, and outstanding verification. The updated MkDocs strict build and Pages deployment must pass before marking complete.

**DOC-02 acceptance criteria:** Compare Zensical with the current MkDocs Material site for theme, navigation, search, Markdown extensions, strict build, and GitHub Pages deployment; document a migration decision and implementation plan before the upstream end-of-life date.

## Prioritization rule
Do not expand activity count at the expense of a reliable accessibility foundation. A small number of well-tested, individually configurable activities is preferable to many unvalidated screens.

Update this roadmap as work proceeds. Move completed items only when exit evidence is documented in [Current status](project-status.md).
