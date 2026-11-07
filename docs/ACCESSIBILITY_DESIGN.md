# Accessibility design and Switch Control contract

## Non-negotiable architecture

SwitchPlay relies on the native iPadOS **Switch Control** feature. It does not implement a private scanning cursor, read physical switch events, pair switches, or configure system switch assignments.

The operating system scans accessibility elements exposed by the app. The app must make meaningful actions discoverable and operable through those elements.

## Intended switch mappings

The intended three-switch workflow is:

| Physical switch role | iPadOS Switch Control action |
| --- | --- |
| Back | Move to Previous Item |
| Next | Move to Next Item |
| Select | Select Item |

These mappings are configured by the iPad user in Settings. The app cannot enforce them. The system's scanning style and switch assignments are user/device configuration.

## Native control principles

1. Prefer native SwiftUI controls such as `Button` and `NavigationLink` for actions.
2. Give each action a stable, descriptive accessibility label. Examples: “Piano note C4”, “Start again”, and “Stop sound”.
3. Add an accessibility hint only when it clarifies what selection will do.
4. Hide decorative SF Symbols from accessibility when the containing control already has a complete label.
5. Avoid duplicate nested accessibility elements. A tile should normally be one actionable navigation element, not a separate icon, title, and button stop.
6. Use semantic grouping intentionally. Do not combine an entire game board into one element if the learner must select individual cards.
7. Make focus order understandable. Layout order should match the intended task sequence as closely as practical.
8. Provide status feedback for match/no-match/completion outcomes and verify that it is understandable with the user's speech and scanning setup.
9. Avoid interactions that require continuous movement, precision dragging, or simultaneous gestures. Use select-then-select patterns.
10. Keep a visible, accessible navigation Back button. The system action Move to Previous Item is a scan-navigation action, not the app's navigation Back action.

## Scanning density

Every extra accessibility element is another potential scanning stop. Conversely, combining controls too aggressively makes independent selection impossible. Organize controls into small meaningful regions.

Examples:
- Matching: each picture/card is its own control; “Start again” is a separate control.
- Piano: each note is its own control; “Stop sound” is a separate control.
- Future music player: transport controls form a distinct region from the instrument keys or sound pads.
- Future puzzle: piece selection and destination selection are separate explicit actions.

## Three-, two-, and one-switch validation

The app should not attempt to infer which configuration the user has selected. Test each configuration by changing Switch Control settings on the device:

- Three switches: Previous Item, Next Item, Select Item with Manual Scanning.
- Two switches: Next Item and Select Item with Manual Scanning.
- One switch: Select Item with Auto Scanning, following the device's available Switch Control options.

Record scan style, switch hardware/interface, iPadOS version, and observed behavior. Configuration options and wording may differ across iPadOS versions.

## Validation boundary

An accessibility label in source code does not establish that a physical switch can select the control. Simulator results do not establish physical switch compatibility. The acceptance test is a successful end-to-end task using iPadOS Switch Control and the intended external switch hardware on a physical iPad.

Do not describe the app as “fully switch accessible” until this testing has been completed with representative users and documented configurations.
