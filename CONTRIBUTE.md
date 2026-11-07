# Contributing to SwitchPlay

SwitchPlay is an accessibility-first native iPadOS project. Contributions should improve meaningful participation, autonomy, and usability for individuals with cortical or cerebral visual impairment (CVI) and people who use external switches.

## Before contributing
1. Read [project goals](docs/goals.md), [current status](docs/project-status.md), and [roadmap](docs/roadmap.md).
2. Read [CVI-centered accessibility principles](docs/accessibility-principles.md) and [Switch Control design](docs/ACCESSIBILITY_DESIGN.md).
3. Review existing issues. For substantial changes, discuss the intended behavior and accessibility implications before implementation.

## Non-negotiable technical constraints
- Use Apple's system-wide iPadOS Switch Control. Do not implement an app-specific scanning engine, scanning cursor, or private switch-input mechanism.
- Prefer native SwiftUI controls with meaningful accessibility semantics.
- Do not make drag-and-drop, precision gestures, or simultaneous actions the only way to complete an essential task.
- Keep scan order predictable and accessibility groupings purposeful.
- Preserve VoiceOver and other relevant iPadOS accessibility behavior.
- Do not claim physical-switch compatibility without testing on a physical iPad with representative hardware.
- Do not claim that one interface is universally accessible to people with CVI.

## CVI-centered expectations
Consider visual complexity, clutter, figure-ground relationships, spacing, crowding, visual boundaries, individual color and contrast preferences, visual field preferences, object familiarity, visual latency, light and motion sensitivity, fatigue, target size, scan density, timing, motor access, and auditory feedback.

Do not assume bright colors, maximum contrast, animation, or minimalist layouts are universally beneficial. Prefer independently adjustable settings over a universal CVI preset. Involve individuals with CVI in design and evaluation whenever possible.

## Development workflow
The native app requires macOS and Xcode to build, sign, and deploy. Windows can be used for source editing and GitHub collaboration, but cannot perform the native Xcode build.

1. Create a focused branch.
2. Keep changes small and explain the user need addressed.
3. Build with Xcode on macOS when changing Swift code.
4. Test on a physical iPad when changes affect Switch Control, focus, audio hardware, or device behavior.
5. Update documentation and `CHANGES.md` when requirements, behavior, or status changes.
6. Submit a pull request with relevant test evidence.

## Pull request checklist
- [ ] User need and expected benefit are described.
- [ ] CVI assumptions and individual customization needs are addressed.
- [ ] Labels, hints, traits, grouping, actions, and focus behavior are reviewed.
- [ ] Switch Control scan order and scan density are considered.
- [ ] No essential workflow depends only on drag-and-drop or a precision gesture.
- [ ] Build/test results are accurate; unrun tests are identified.
- [ ] Physical-device testing is included when required or explicitly marked pending.
- [ ] Documentation and change notes are updated.
- [ ] No identifying participant information is included.

## Test reports and privacy
Include device model, iPadOS version, app commit, switch hardware/interface, assignments, scanning style, steps, and observed outcomes. Never publish names, faces, recordings, medical records, or other identifying participant information in issues or pull requests.

## Documentation development
Install Python 3.10 or later, then run:

```sh
python -m pip install -r requirements-docs.txt
mkdocs serve
mkdocs build --strict
```

## Code style
All Swift contributions must follow the repository [CODE_STYLE.md](CODE_STYLE.md) and the checked-in [.swift-format](.swift-format) configuration. Run `swift-format lint --strict --recursive SwitchPlay` before submitting and report the result. The guide covers Swift naming/API design, file organization, SwiftUI state and view composition, error handling, concurrency, audio lifecycle, accessibility semantics, documentation, and testing. Do not introduce a competing formatter or change formatter settings without review. Formatting and linting do not replace compilation, tests, physical-device checks, or participatory accessibility evaluation.

For suspected vulnerabilities, follow [SECURITY.md](SECURITY.md) and do not post details publicly.
