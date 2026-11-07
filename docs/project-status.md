# Current project status

> **Completion authority:** The LLM may report implementation progress, but only the user can confirm user-owned manual checks. No manual/device/participant task is complete until the user reports the result and evidence is recorded. See the [LLM tracking workflow](llm-workflow.md).

**Status: early prototype; first native build and physical-device validation are pending.**

This is the living snapshot of what exists, what is verified, and what should happen next. Update it whenever work is completed or priorities change.

## Stage and task tracker

Status is evidence-based. This tracker is the live summary; detailed acceptance criteria remain in the [roadmap](roadmap.md).

| Stage | Stage status | Task IDs | Current state / next action |
| --- | --- | --- | --- |
| Contributor CI | BLOCKED | CI-01 | Workflow is implemented and now pins swift-format 604.0.0. Earlier strict lint runs failed on existing source formatting violations; run the updated workflow and resolve diagnostics. |
| 0 — Establish a native build | BLOCKED | ST0-01–ST0-07 | ST0-01 requires user to obtain Mac access; subsequent setup/build tasks depend on it. |
| 1 — Verify existing prototype | BLOCKED | ST1-01–ST1-07 | Requires Stage 0 build/install and physical iPad access. |
| 2 — CVI accessibility foundation | NOT_STARTED | CVI-01–CVI-07 | Requires participatory requirements work; do not finalize universal visual defaults. |
| 3 — Core activities | NOT_STARTED | ACT-01–ACT-06 | Begin after accessibility foundation and activity acceptance criteria are established. |
| 4 — Music experiences | NOT_STARTED | MUS-01–MUS-05 | Piano source exists but remains unbuilt and untested; other music modules are planned. |
| 5 — Personalization and reliability | NOT_STARTED | PER-01–PER-06 | Planned; no completion evidence recorded. |
| 6 — Field evaluation and release readiness | NOT_STARTED | REL-01–REL-06 | Requires participatory evaluation, physical hardware testing, defect resolution, and evidence review. |
| Documentation and toolchain consistency | IN_PROGRESS | DOC-01–DOC-02 | Repository audit and version alignment implemented; updated documentation workflow must pass. Evaluate Zensical before Material for MkDocs reaches end of life on 2027-05-05. |

### Task status details

| Task ID | Status | Owner | Evidence / next action |
| --- | --- | --- | --- |
| CI-01 | IMPLEMENTED_UNVERIFIED | Joint | Workflow now installs and asserts swift-format 604.0.0. Runs 42402374179, 42402425701, 42402478967, and latest run 42403314021 failed strict lint on existing source formatting. The latest run successfully installed and verified swift-format 604.0.0 before reporting indentation, line-length, and trailing-comma violations. Format `SwitchPlay`, rerun, and record a passing run. |
| ST0-01 | BLOCKED | User | Obtain Mac access; report macOS and Xcode versions. |
| ST0-02–ST0-07 | BLOCKED | Joint | Depend on ST0-01; complete setup, project generation, signing, build, install, and launch in sequence. |
| ST1-01–ST1-07 | BLOCKED | Joint | Await successful Stage 0 build and physical iPad validation. |
| CVI-01–CVI-07 | NOT_STARTED | Joint | Plan requirements review and participatory design; document decisions and evidence. |
| ACT-01–ACT-06 | NOT_STARTED | Joint | Define activity-specific acceptance criteria before implementation. |
| MUS-01 | IMPLEMENTED_UNVERIFIED | Joint | Piano prototype source exists but is not compiled or tested; define improvements after the initial build and accessibility foundation. |
| MUS-02–MUS-05 | NOT_STARTED | Joint | Drums/soundboard, composer, prerecorded player, and audio reliability work remain planned. |
| PER-01–PER-06 | NOT_STARTED | Joint | Define individual settings, persistence, and lifecycle requirements. |
| REL-01–REL-06 | NOT_STARTED | Joint | Schedule after core features and accessibility validation are ready. |
| DOC-01 | IMPLEMENTED_UNVERIFIED | Joint | Repository-wide requirements and toolchain audit added at `docs/repository-audit.md`; verify the updated strict MkDocs build and Pages deployment. |
| DOC-02 | NOT_STARTED | Joint | Evaluate migration from MkDocs Material to Zensical before 2027-05-05; check theme, navigation, search, strict build, and Pages deployment. |

### Current next action

**USER ACTION REQUIRED — ST0-01: Obtain access to a Mac with supported Xcode.**

Confirm whether a Mac is available. If yes, report its macOS version and Xcode version. Until this prerequisite is confirmed, the native build stage remains blocked and no build or device-compatibility claim can be made.

## Implemented in the repository

| Area | Current contents | Verification |
| --- | --- | --- |
| App shell | SwiftUI entry point and NavigationStack home screen | Source committed; not built |
| Matching | Four picture-symbol pairs with select-two interaction | Source committed; not built or user-tested |
| Music | Eight synthesized piano notes using AVAudioEngine | Source committed; not built or audio-tested |
| Project setup | XcodeGen specification targeting iOS 17+ | Not generated or built with Xcode |
| Accessibility planning | Switch Control design contract and testing guides | Documentation exists; behavior unverified |
| CVI prompt library | 15 LLM prompts, including mandatory P00 tracking prompt and Swift style checks | JSON committed |
| Documentation site | MkDocs Material 9.8.0, pinned requirements, and GitHub Pages workflow | Prior build/deploy run 42402479023 succeeded; verify again after action upgrades |
| Swift contributor standards | CODE_STYLE.md, root .swift-format, and pinned 604.0.0 CI workflow | Workflow updated; source lint remains failing pending reformat |

## Not yet verified
- The latest observed Swift formatting run (42403314021) installed and verified swift-format 604.0.0 successfully, then failed strict lint on existing source-format violations. Earlier runs used the Xcode-bundled Swift-format 6.3.0; the workflow has since been updated to install and assert 604.0.0, so its new run must be evaluated separately.
- The updated documentation workflow has not yet been verified after upgrading its GitHub Actions to current major releases and pinning MkDocs Material 9.8.0. Previous build/deploy run 42402479023 succeeded.
- Whether the source compiles with the current Xcode and iPadOS SDK remains unverified.
- Whether the app installs and launches on a physical iPad remains unverified.
- Whether interactive controls work through system-wide Switch Control remains unverified.
- Whether one-, two-, and three-switch workflows work with representative physical hardware remains unverified.
- Whether visual presentation works for people with different CVI characteristics remains unverified.
- Whether audio behavior is reliable across routes and interruptions remains unverified.

## Immediate next steps
1. Format the existing Swift files with the checked-in `.swift-format` configuration using swift-format 604.0.0, then rerun CI-01 until strict lint passes.
2. Arrange access to a Mac with a supported Xcode installation.
3. Clone the repository, install XcodeGen, and generate the Xcode project.
4. Configure a unique bundle identifier and signing team.
5. Build and install the prototype on a physical iPad.
6. Resolve compiler and runtime errors before expanding features.
7. Test home, matching, and piano with touch and system-wide Switch Control.
8. Record device, iPadOS, switch hardware, assignments, scan style, outcomes, and defects.
9. Begin CVI-centered requirements and participatory design before finalizing visual defaults.

See [Development environment setup](development-environment.md), [Build and device testing](BUILD_AND_DEVICE_TESTING.md), and the [repository consistency audit](repository-audit.md).

## Environment constraint
The current workflow has access to a Windows computer and an iPad. Windows can edit source and manage Git, but Xcode, the iPadOS SDK, signing, and native deployment require macOS. A Mac is a prerequisite for the first build and physical-device test.

## USER ACTION REQUIRED

**ST0-01 — Obtain access to a Mac with supported Xcode**

- **Owner:** User
- **Status:** BLOCKED until Mac access is available.
- **Action:** Arrange access to a Mac capable of running a current supported Xcode release.
- **Report back:** Confirm whether a Mac is available and, if so, its macOS and Xcode versions.
- **Completion rule:** Do not check off the corresponding roadmap item until the user confirms access and the environment details are recorded.

**ST0-06 — Build, install, and launch on a physical iPad**

- **Owner:** User, with LLM assistance for troubleshooting.
- **Status:** BLOCKED by ST0-01 and the remaining Stage 0 setup tasks.
- **Action after prerequisites:** Generate the Xcode project, configure signing, then build, install, and launch on the iPad.
- **Report back:** Pass/fail, tested commit, Xcode version, iPad model, iPadOS version, and any complete build or launch error.
- **Completion rule:** Keep the roadmap checkbox unchecked until the user reports the result and evidence is recorded.

## Task status conventions

Use the status vocabulary in the [LLM workflow](llm-workflow.md). Source committed, build passed, Simulator tested, physical iPad tested, physical switches tested, and participatory CVI evaluation are separate evidence levels. Do not collapse them into a single "done" state.

## Update policy
When a task is completed, update this page and the roadmap in the same change. Mark work complete only when its stated evidence exists. Keep pending, blocked, and unverified work distinct.
