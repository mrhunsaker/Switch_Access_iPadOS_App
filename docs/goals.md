# Project goals

These are enduring product goals. Implementation status is tracked in [Current status](project-status.md), and planned work is tracked in the [Roadmap](roadmap.md).

## Primary goal
Create a native iPadOS application that supports meaningful learning, communication, recreation, and creative participation through Apple's system-wide Switch Control, with accessibility designed around the diverse needs and preferences of individuals with CVI.

## User-centered goals
1. **Individualized visual access:** Provide independent presentation controls so users can find settings that work for them. Do not impose a universal CVI mode.
2. **Predictable interaction:** Use stable layouts, clear feedback, manageable choice sets, and consistent navigation.
3. **Multiple ways to participate:** Avoid making vision, fine motor precision, rapid responses, or a single sensory channel mandatory for essential participation.
4. **Switch access:** Expose meaningful native accessibility elements to iPadOS Switch Control and evaluate one-, two-, and three-switch configurations.
5. **Autonomy and choice:** Enable individuals to express preferences and make choices, with assistance available when wanted.
6. **Useful activities:** Develop matching, memory, cause-and-effect, puzzles, sequencing, creative activities, and music experiences.
7. **Responsible evaluation:** Involve people with CVI and relevant practitioners; protect privacy and avoid unsupported clinical or learning-outcome claims.

## Technical goals
- Native SwiftUI application targeting iPadOS.
- Apple's system-wide Switch Control; no custom scanning engine or cursor.
- Native accessibility semantics and predictable scan order.
- Select-then-select interactions where spatial placement is needed; no essential drag-only workflows.
- Modular activities with reusable accessibility patterns.
- Maintainable source, documented decisions, and repeatable build and device tests.

## What success means
Success is not simply activity count or a successful compile. Evidence includes meaningful controls being usable through preferred access methods; visual customization evaluated with different users; predictable, recoverable interactions; documented physical-switch testing; and product decisions shaped by people with CVI.

## Explicit non-goals
SwitchPlay does not diagnose CVI, prescribe clinical interventions, replace individualized vision assessment, or claim therapeutic efficacy. It does not configure physical switches or read system Switch Control settings.
