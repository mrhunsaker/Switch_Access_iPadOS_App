# Current project status

> **Completion authority:** The LLM may report implementation progress, but only the user can confirm user-owned manual checks. No manual/device/participant task is complete until the user reports the result and evidence is recorded. See the [LLM tracking workflow](llm-workflow.md).

**Status: early prototype; first native build and physical-device validation are pending.**

This is the living snapshot of what exists, what is verified, and what should happen next. Update it whenever work is completed or priorities change.

## Implemented in the repository

| Area | Current contents | Verification |
| --- | --- | --- |
| App shell | SwiftUI entry point and NavigationStack home screen | Source committed; not built |
| Matching | Four picture-symbol pairs with select-two interaction | Source committed; not built or user-tested |
| Music | Eight synthesized piano notes using AVAudioEngine | Source committed; not built or audio-tested |
| Project setup | XcodeGen specification targeting iOS 17+ | Not generated or built with Xcode |
| Accessibility planning | Switch Control design contract and testing guides | Documentation exists; behavior unverified |
| CVI prompt library | 14 LLM prompts and shared instructions | JSON committed |
| Documentation site | MkDocs Material configuration and Pages workflow | Workflow committed; deployment pending |

## Not yet verified
- The source compiles with the current Xcode and iPadOS SDK.
- The app installs and launches on a physical iPad.
- Interactive controls work through system-wide Switch Control.
- One-, two-, and three-switch workflows work with representative physical hardware.
- Visual presentation works for people with different CVI characteristics.
- Audio behavior is reliable across routes and interruptions.

## Immediate next steps
1. Arrange access to a Mac with a supported Xcode installation.
2. Clone the repository, install XcodeGen, and generate the Xcode project.
3. Configure a unique bundle identifier and signing team.
4. Build and install the prototype on a physical iPad.
5. Resolve compiler and runtime errors before expanding features.
6. Test home, matching, and piano with touch and system-wide Switch Control.
7. Record device, iPadOS, switch hardware, assignments, scan style, outcomes, and defects.
8. Begin CVI-centered requirements and participatory design before finalizing visual defaults.

See [Development environment setup](development-environment.md) and [Build and device testing](BUILD_AND_DEVICE_TESTING.md).

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
