# SwitchPlay — iPadOS Switch Access Learning App

SwitchPlay is a native iPadOS prototype for teaching and reinforcing use of **Apple's system-wide Switch Control**. The project is intended for iterative design with students and educators, including K–12 learners with visual impairments and learners who use external switches.

## Core design requirement

SwitchPlay uses iPadOS Switch Control rather than implementing its own scanning engine. Interactive app controls must be exposed as native, individually understandable accessibility elements so the operating system's scanning cursor can reach them.

The intended three-switch mapping is configured by the iPad user in iPadOS:

- **Back** — Move to Previous Item
- **Next** — Move to Next Item
- **Select** — Select Item

SwitchPlay cannot assign, inspect, pair, or configure physical switches or system scanning settings.

## Current prototype

Phase 1 source includes:
- A SwiftUI home screen with seven activity destinations
- A picture-matching activity with select-two-to-match interaction
- A simple eight-note synthesized piano using AVAudioEngine
- Native NavigationStack navigation and an ordinary navigation Back button
- Accessibility labels and hints on the primary interactive controls
- An XcodeGen project specification targeting iOS 17 and later

Other activity destinations are placeholders for later phases.

**Build status:** source starter only. This repository has not yet been compiled, signed, installed, or validated on a physical iPad. Do not treat source presence or accessibility labels as proof of working Switch Control behavior.

## Development environment

Xcode and the iPadOS SDK require macOS. Source files can be edited on Windows, but building, signing, and installing this native app require access to a Mac with Xcode.

## Project documentation

The project documentation is published with MkDocs Material through GitHub Actions: [Open the SwitchPlay documentation site](https://mrhunsaker.github.io/Switch_Access_iPadOS_App/). Documentation source is maintained in `docs/`.

The LLM prompt library includes **P00**, the required project-wide documentation and progress-tracking prompt. It enforces stable task IDs, explicit stage statuses, synchronized documentation, and user-confirmed manual verification gates. See the [LLM workflow](docs/llm-workflow.md) before using other prompts.

See:
- [Swift code style and contributor standards](CODE_STYLE.md)
- [Development roadmap](docs/DEVELOPMENT_ROADMAP.md)
- [Build and physical-device testing](docs/BUILD_AND_DEVICE_TESTING.md)
- [Accessibility architecture](docs/ACCESSIBILITY_DESIGN.md)
- [Phase 1 acceptance checklist](docs/PHASE_1_ACCEPTANCE.md)
- [Project goals](docs/goals.md)
- [Current project status](docs/project-status.md)
- [Living development roadmap](docs/roadmap.md)
- [CVI-centered accessibility principles](docs/accessibility-principles.md)
- [LLM-assisted development workflow](docs/llm-workflow.md)

## Generate the Xcode project

On a Mac with Xcode installed, install XcodeGen (for example, using Homebrew), then run from the repository root:

```sh
brew install xcodegen
xcodegen generate
open SwitchPlay.xcodeproj
```

In Xcode, select an iPad run destination and configure a development Team under Signing & Capabilities. Replace the example bundle identifier `org.example.SwitchPlay` with one you control before signing.

## Configure iPadOS Switch Control

On the iPad, open **Settings → Accessibility → Switch Control → Switches** and add the external switches. Assign the actions listed above. Choose **Scanning Style → Manual Scanning** for the three-switch workflow.

For controlled testing:
- One switch: configure Select Item and use Auto Scanning.
- Two switches: configure Move to Next Item and Select Item with Manual Scanning.
- Three switches: configure Move to Previous Item, Move to Next Item, and Select Item with Manual Scanning.

Exact settings labels and available options can vary by iPadOS release and switch hardware. Consult Apple's current user guide if the labels differ.

## Scope and limitations

This is an early accessibility prototype, not a finished educational, clinical, or therapeutic product. It has no persistence, educator dashboard, imported music library, prerecorded music player, MIDI support, configurable curriculum, or production-ready error handling. Matching currently uses a small fixed set of picture-symbol pairs. The piano generates short synthesized tones.

Real-world usability testing with intended users, educators, and the actual switch hardware is required before making accessibility or learning-outcome claims.
