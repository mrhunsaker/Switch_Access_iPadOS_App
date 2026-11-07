# Phase 1 acceptance checklist

Use this checklist only after a successful build and install on a physical iPad. Record the device, iPadOS version, switch hardware, and app commit for each run.

## Build and launch
- [ ] XcodeGen generates the Xcode project without errors.
- [ ] Xcode builds the app for a physical iPad.
- [ ] Signing succeeds with a bundle identifier controlled by the developer.
- [ ] App launches and displays the SwitchPlay home screen.

## Touch baseline
- [ ] All seven activity tiles are visible and understandable.
- [ ] Matching and Music Studio open.
- [ ] Placeholder destinations are clearly identified as planned, not implemented.
- [ ] Standard app navigation Back returns to the home screen.
- [ ] Matching can be completed and reset with touch.
- [ ] Piano notes produce tones; Stop sound stops playback.

## System-wide Switch Control
- [ ] iPadOS Switch Control scanning cursor reaches each home-screen activity tile.
- [ ] Select opens the chosen activity.
- [ ] Matching cards are individually scanned and announced.
- [ ] Selecting two cards gives clear match/no-match feedback.
- [ ] Matched cards are no longer actionable in a predictable way.
- [ ] Start again is independently reachable and works.
- [ ] Every piano note is independently scanned and announced.
- [ ] Stop sound is independently reachable and works.
- [ ] The app's navigation Back control is reachable and returns home.
- [ ] No custom app-only scanning behavior is required.

## Configuration coverage
- [ ] Three-switch Manual Scanning: Previous Item, Next Item, Select Item.
- [ ] Two-switch Manual Scanning: Next Item, Select Item.
- [ ] One-switch Auto Scanning: Select Item.
- [ ] Forward and reverse movement are predictable where configured.
- [ ] Scan order and scan density are usable for the intended learner.

## Usability and safety
- [ ] Controls have clear labels and useful selection feedback.
- [ ] No essential task depends on drag-and-drop or a precision gesture.
- [ ] Audio is at an appropriate level and can be stopped.
- [ ] Leaving Music Studio stops the currently playing tone.
- [ ] Intended users and educators have reviewed the interaction model.

## Release gate

Do not mark Phase 1 complete until the build and physical-device Switch Control checks pass. Record failures as GitHub issues with reproducible steps and without personal or identifying student data.
