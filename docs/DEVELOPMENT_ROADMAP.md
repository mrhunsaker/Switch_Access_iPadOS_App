# SwitchPlay development roadmap

This roadmap is the working sequence for developing SwitchPlay as a native iPadOS app. The central acceptance criterion is real operation through Apple's system-wide Switch Control scanning cursor, not a custom in-app scanner.

## Phase 0 — Environment and project setup

1. Confirm access to a Mac that can run a current supported version of Xcode. Windows can be used for editing and GitHub, but cannot run Xcode or build/sign this iPadOS app.
2. Install Xcode and launch it once to complete setup.
3. Install XcodeGen, clone this repository, and generate the project from `project.yml`.
4. Set a unique bundle identifier and configure signing for the iPad.
5. Build and run the untouched prototype on a physical iPad. Record compiler errors and resolve them before feature work.

**Exit criteria:** a successful Xcode build and a launch on the target iPad. No claim of switch compatibility yet.

## Phase 1 — Verify the existing prototype

1. Test home-screen navigation with touch.
2. Enable iPadOS Switch Control and test the activity tiles with the system scanning cursor.
3. Test the Matching activity and verify each card is independently reachable and announced.
4. Test the piano and verify each note and Stop sound control is independently reachable.
5. Test one-, two-, and three-switch configurations using the device settings documented in [Build and device testing](BUILD_AND_DEVICE_TESTING.md).
6. Record iPadOS version, switch interface/hardware, scan style, focus order, speech output, and any failures.

**Exit criteria:** the basic home, matching, piano, navigation, and audio workflows pass the acceptance checklist on a physical iPad.

## Phase 2 — Accessibility foundation

Before adding many activities, establish reusable interaction and accessibility conventions:
- Each meaningful action is a native SwiftUI control where possible.
- Every control has a concise, unambiguous accessibility label.
- Hints describe the result of selection, not visual appearance alone.
- Decorative images are hidden from accessibility when their meaning is already spoken by the control label.
- Focus order is predictable and does not include decorative layout elements.
- Large activities are grouped logically; avoid a single enormous group and avoid excessive focus stops.
- Provide visible selection, completion, error, and reset feedback.
- Every workflow has a touch fallback and a clear way to return.
- Avoid drag-and-drop as the only interaction. Prefer select-item then select-destination.

**Exit criteria:** a documented reusable pattern and a small set of accessibility regression tests performed with Switch Control.

## Phase 3 — Core learning activities

Implement and test one activity at a time:
1. Cause and effect: select a large target; provide immediate visual and optional audio feedback.
2. Matching: configurable pair count, picture choices, retry behavior, and clear success state.
3. Memory: reveal/hide pair game with adjustable number of cards.
4. Sequencing: choose the next item in a simple pattern.
5. Puzzles: select a piece, then select its destination; never require dragging.
6. Creative: choose colors, shapes, or stickers through discrete accessible controls.

Each activity should support a simple mode first, then adjustable complexity. Do not assume that more choices or faster scanning is better.

## Phase 4 — Music experiences

Build a coherent music area with separately accessible modules:
- Instrument play: piano, drums, and a soundboard.
- Music creation: a simple sequence/composer with discrete add, remove, and play controls.
- Prerecorded music: a player with accessible Play/Pause, Stop, Previous, Next, and volume controls.

Keep instrument controls separate from transport controls to prevent very long scan sequences. Use AVAudioEngine for generated instruments and AVPlayer/AVAudioPlayer for media playback as appropriate. Treat MusicKit or Core MIDI as optional later integrations, not prerequisites for the first accessible music workflow.

## Phase 5 — Personalization and reliability

Potential later work:
- Adjustable scan-friendly target size and spacing
- Adjustable number of choices and activity difficulty
- Sound and speech preferences
- Session progress stored locally with clear privacy expectations
- Educator/caregiver setup guidance
- Robust interruption, route-change, and audio-session handling
- Localization and high-contrast/visual presentation options

## Phase 6 — Field validation and release readiness

Test with students and educators in realistic environments, with consent and appropriate safeguards. Document task completion, time, errors, fatigue, preference, and device configuration. Accessibility testing should include different switch hardware and motor access patterns. Resolve issues before publishing or making efficacy claims.

## Current status

The repository contains the Phase 1 source starter and the guides in this directory. It has **not** been compiled or tested on a physical iPad. The next immediate task is Phase 0: arrange Mac/Xcode access, generate the project, and perform a first build.
