# SwitchPlay

**SwitchPlay is a native iPadOS project focused on accessible switch interaction and individualized access for people with cortical or cerebral visual impairment (CVI).**

The app is designed to use Apple's system-wide **Switch Control**, not an app-specific scanner.

## Current state
The repository contains an early SwiftUI source prototype: a home screen, picture-matching activity, and synthesized piano. The source has not yet been compiled, signed, or tested on a physical iPad.

The immediate priority is a reliable native build followed by physical-device Switch Control validation. In parallel, the project is defining a CVI-centered accessibility architecture before expanding activities.

- [Project goals](goals.md)
- [Current status and next actions](project-status.md)
- [Development roadmap](roadmap.md)
- [CVI-centered accessibility principles](accessibility-principles.md)
- [Development environment setup](development-environment.md)
- [LLM-assisted development](llm-workflow.md)

## A note about CVI
CVI is heterogeneous. Visual access, recognition, attention, field preferences, visual latency, contrast preferences, sensory responses, and fatigue vary between individuals and contexts. SwitchPlay must support individualized presentation rather than assume one visual preset works for everyone.

People with CVI must participate in design and evaluation. An LLM, code review, or successful build cannot establish that an interface is accessible to a particular person.

[Source repository](https://github.com/mrhunsaker/Switch_Access_iPadOS_App).
