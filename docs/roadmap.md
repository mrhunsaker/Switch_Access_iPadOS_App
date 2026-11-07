# Development roadmap

This is the living forward plan. It extends the original [technical roadmap](DEVELOPMENT_ROADMAP.md) and prioritizes CVI-centered accessibility before feature expansion.

## Stage 0 — Establish a native build
- [ ] Obtain access to a Mac with supported Xcode.
- [ ] Install Xcode and complete first-launch setup.
- [ ] Install XcodeGen and clone the repository.
- [ ] Generate and open the Xcode project.
- [ ] Set a unique bundle identifier and configure signing.
- [ ] Build, install, and launch on a physical iPad.
- [ ] Resolve compiler and launch issues.

**Exit evidence:** successful build and launch recorded with Xcode version, iPad model, iPadOS version, and tested commit.

## Stage 1 — Verify the existing prototype
- [ ] Test home navigation with touch.
- [ ] Test matching, reset, and status feedback.
- [ ] Test piano notes and Stop sound.
- [ ] Test one-switch Auto Scanning.
- [ ] Test two-switch Manual Scanning.
- [ ] Test three-switch Manual Scanning.
- [ ] Document scan order, focus stops, missed activations, and audio behavior.

**Exit evidence:** completed acceptance checklist and reproducible physical-device test record. Do not claim switch compatibility before this stage passes.

## Stage 2 — Define and implement the CVI accessibility foundation
- [ ] Review requirements with people with CVI and relevant practitioners.
- [ ] Define a modular visual customization model.
- [ ] Evaluate independent settings for color, contrast, object size, spacing, choice count, visual boundaries, text, animation, and timing.
- [ ] Define predictable layouts without assuming one visual profile.
- [ ] Establish feedback, timing, and error-recovery conventions.
- [ ] Establish reusable SwiftUI accessibility patterns.
- [ ] Define privacy-conscious participatory testing methods.

**Exit evidence:** documented requirements, design rationale, prototype settings, and feedback from people with varied CVI characteristics.

## Stage 3 — Core activities
- [ ] Cause and effect.
- [ ] Configurable matching.
- [ ] Memory.
- [ ] Sequencing.
- [ ] Select-piece/select-destination puzzles.
- [ ] Creative activities.

Each activity must have acceptance criteria, accessible interaction paths, and test results before being called complete.

## Stage 4 — Music experiences
- [ ] Piano improvements and configurable layout.
- [ ] Drums and soundboard.
- [ ] Simple composer with discrete controls.
- [ ] Prerecorded music player with accessible transport controls.
- [ ] Audio volume, stop behavior, interruptions, and route-change testing.

## Stage 5 — Personalization and reliability
- [ ] Persistent individual settings and preview.
- [ ] Adjustable activity complexity and choice count.
- [ ] Adjustable feedback and audio preferences.
- [ ] Privacy-preserving session progress, if useful.
- [ ] Interruption and lifecycle handling.
- [ ] Localization and further accessibility evaluation.

## Stage 6 — Field evaluation and release readiness
- [ ] Participatory usability testing with appropriate consent and safeguards.
- [ ] Evaluate varied CVI characteristics, motor access patterns, and switch hardware.
- [ ] Review fatigue, independence, predictability, errors, and preference—not speed alone.
- [ ] Resolve critical accessibility defects.
- [ ] Verify public claims against evidence.
- [ ] Publish known limitations and release documentation.

## Prioritization rule
Do not expand activity count at the expense of a reliable accessibility foundation. A small number of well-tested, individually configurable activities is preferable to many unvalidated screens.

Update this roadmap as work proceeds. Move completed items only when exit evidence is documented in [Current status](project-status.md).
