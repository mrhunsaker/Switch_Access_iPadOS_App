# Swift code style and engineering standards

This document defines the required Swift conventions for SwitchPlay contributors. The goal is readable, maintainable, reviewable SwiftUI code with consistent formatting, safe concurrency, and accessibility behavior that can be verified.

**Authority order:** Swift language and Apple platform requirements first; the [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/) for naming and API design; this document for project conventions; the checked-in [.swift-format](.swift-format) file for mechanical formatting. If guidance conflicts, explain the conflict in the pull request rather than silently inventing a convention.

## 1. References

Use these primary references and check them when APIs or tool behavior may have changed:

- [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/) — naming, clarity, API documentation, and idiomatic declarations.
- [The Swift Programming Language](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) — language semantics and core features.
- [Swift concurrency](https://docs.swift.org/latest/documentation/the-swift-programming-language/concurrency/) — structured concurrency, actors, isolation, and Sendable.
- [Apple SwiftUI documentation](https://developer.apple.com/documentation/swiftui) — supported SwiftUI APIs and platform behavior.
- [SwiftUI accessibility fundamentals](https://developer.apple.com/documentation/swiftui/accessibility-fundamentals) — accessibility elements and modifiers.
- [Apple SwiftUI accessibility modifiers](https://developer.apple.com/documentation/swiftui/view-accessibility) — labels, values, hints, actions, and grouping.
- [swift-format configuration reference](https://github.com/swiftlang/swift-format/blob/main/Documentation/Configuration.md) — formatter settings.
- [swift-format lint rules](https://github.com/swiftlang/swift-format/blob/main/Documentation/RuleDocumentation.md) — lint behavior and rule definitions.
- [Google Swift Style Guide](https://google.github.io/swift/) — supplementary community style reference; it does not override Swift.org or this repository's configuration.

Prefer official Swift.org and Apple documentation for language and platform questions. Confirm availability against the project's deployment target (iPadOS 17+) and the actual SDK used to build.

## 2. Formatting parameters

The repository root `.swift-format` file is the canonical formatter configuration. CI currently uses `swift-format` 604.0.0 (verified 2026-11-07); contributors should use the same release to avoid tool-version drift.

| Parameter | Project setting |
| --- | --- |
| Formatter | swift-format from the Swift project |
| Configuration version | 1 |
| Indentation | 2 spaces; do not use tabs |
| Maximum line length | 100 characters where practical |
| Consecutive blank lines | 1 maximum |
| Existing intentional line breaks | Preserve when valid |
| Multiline function arguments | One argument per line when the declaration wraps |
| Switch case indentation | Cases align with switch |
| Import organization | Group normal imports and sort within groups |
| File-scoped implementation details | Prefer private |
| Trailing commas | Keep consistent with formatter output |
| Documentation comments | Use Swift documentation comments (///) |

Run the formatter and linter from the repository root:

    # Install the current project-pinned formatter on macOS with Homebrew.
    brew install swift-format

    # Check the installed formatter version (CI currently requires 604.0.0).
    swift-format --version

    # Format Swift source files in place.
    swift-format format --in-place --recursive SwitchPlay

    # Lint Swift source files; strict mode makes diagnostics fail the command.
    swift-format lint --strict --recursive SwitchPlay

If swift-format is not installed, follow the installation instructions in the [swift-format repository](https://github.com/swiftlang/swift-format). Keep the local version aligned with the version recorded in [the repository audit](docs/repository-audit.md); update both the CI pin and this guide together when deliberately upgrading. Do not substitute a different formatter configuration without proposing and reviewing the change.

Formatting is not a substitute for compilation, tests, accessibility review, or physical-device testing. Record commands actually run and their results. Do not claim a check passed if it was not run.

## 3. Naming and API design

Follow Swift.org's API Design Guidelines:

- Types, protocols, and associated types use UpperCamelCase.
- Properties, functions, methods, enum cases, and local values use lowerCamelCase.
- Name values by their role and meaning, not merely their type.
- Prefer clear names at the call site over short or cryptic names.
- Omit redundant words, but retain words needed to make behavior unambiguous.
- Use argument labels to make calls read naturally.
- Use Boolean names that read as assertions, such as isPlaying, hasSelection, or canAdvance.
- Name side-effecting operations with verbs; name values and non-mutating queries with nouns or descriptive phrases.
- Avoid abbreviations unless they are widely understood in the domain. Use consistent capitalization for established initialisms.
- Avoid type names that collide with Swift or Apple framework types.
- Avoid ambiguous overloads, especially overloads differentiated only by return type.

Prefer:

    func selectActivity(_ activity: Activity)
    func moveSelection(from currentIndex: Int, to destinationIndex: Int)
    var isAudioPlaying: Bool

Avoid unclear names such as doThing(), data2, val, or flag.

## 4. File and type organization

- Keep one primary type or tightly related group of types per file. Name the file after its primary type.
- Keep files focused. Split unrelated models, services, views, and test helpers into separate files.
- Group related declarations with // MARK: - comments when a file has multiple logical sections.
- Place imports at the top; import only modules directly needed by the file.
- Prefer value types (struct, enum) unless reference semantics are required.
- Keep implementation details private or fileprivate only when file scope is genuinely needed. Do not expose public APIs without a real module boundary or consumer.
- Prefer composition and small focused types over deep inheritance or oversized manager objects.
- Avoid premature abstraction, speculative general-purpose frameworks, and unnecessary dependencies.
- Do not add third-party packages for functionality already provided adequately by the Swift standard library or Apple frameworks without explaining the tradeoff.

## 5. SwiftUI conventions

- Keep body declarative and side-effect free. Put work in explicit actions, task handlers, or dedicated model/service types.
- Extract meaningful subviews when doing so improves comprehension, reuse, or testability. Do not split views into arbitrary fragments solely to reduce line count.
- Keep state ownership explicit. Use @State for state owned by a view, and pass values or bindings to child views according to their responsibilities.
- Prefer immutable inputs and derived values over duplicated mutable state.
- Use the Observation or Combine model that best fits the deployment target and existing architecture; do not mix state-management approaches without a reason.
- Avoid AnyView unless type erasure is specifically required.
- Use stable, meaningful identifiers for dynamic collections. Do not use array indices as identity when elements can be inserted, removed, or reordered.
- Avoid expensive work in body; keep long-running work asynchronous and cancellable.
- Keep navigation, presentation, and model state explicit and predictable.
- Do not use private or undocumented SwiftUI APIs. Verify new modifiers and overloads against Apple documentation and the project's iPadOS deployment target.

## 6. Error handling and safety

- Prefer explicit error propagation with throws and meaningful error types where callers can recover or provide useful feedback.
- Handle errors at the layer that can make a meaningful decision; do not silently swallow failures.
- Avoid try!, force unwraps (!), and implicitly unwrapped optionals. If an exceptional use is genuinely unavoidable, document the invariant and obtain reviewer approval.
- Use guard for early exits when it improves clarity.
- Do not use as! or unsafe operations without a documented, reviewed justification.
- Avoid broad catch-all handling that hides the underlying failure.
- Validate external input and handle empty, missing, and boundary states.
- Do not log sensitive user or participant information.

## 7. Concurrency and audio

- Prefer structured concurrency (async/await, task groups) over nested completion-handler chains when supported by the API.
- Make actor isolation explicit for shared mutable state. UI-facing state belongs on the main actor where appropriate.
- Design shared data to be immutable or Sendable where practical.
- Avoid Task.detached unless there is a documented reason and isolation requirements are understood.
- Check cancellation in long-running work and avoid untracked tasks.
- Never block the main actor with file I/O, expensive computation, waits, or synchronous work that can be asynchronous.
- Keep audio-engine ownership and lifecycle in a focused audio service. Do not mutate UI state from real-time audio callbacks.
- Treat audio session interruptions, route changes, playback stop behavior, and engine failures as explicit states to handle and test.
- Do not silence Swift concurrency warnings with unchecked annotations or unsafe escapes without documenting and reviewing the safety argument.
- Do not change the project's Swift language mode or strict-concurrency settings as a formatting-only change. Propose a migration separately and record compiler/toolchain evidence.

## 8. Accessibility is part of code quality

Accessibility requirements are implementation requirements, not optional polish.

- Prefer native SwiftUI controls and native accessibility semantics.
- Provide meaningful labels, values, hints, traits, and actions where the default semantics are insufficient.
- Group or separate accessibility elements intentionally. Avoid unnecessary scan stops and confusing nested elements.
- Keep focus and scan order predictable as content changes.
- Do not make color the only way to communicate state or correctness.
- Do not make drag-and-drop, precision gestures, or simultaneous actions the only route through an essential workflow.
- Keep the app's navigation Back action distinct from the iPadOS Switch Control Move to Previous Item action.
- Use Apple's system-wide Switch Control. Never add an app-specific scanning engine, scanning cursor, or private switch-input mechanism.
- CVI is heterogeneous. Never encode a universal CVI visual profile or assume a specific color, contrast, density, or layout works for everyone. Keep presentation settings independently configurable where feasible.
- Consider visual latency, fatigue, figure-ground distinction, crowding, target size, predictable placement, optional auditory feedback, and user autonomy.
- Do not claim accessibility or Switch Control compatibility based only on code inspection, accessibility labels, or a successful build. Follow the physical-device and participatory verification gates in the roadmap.

See [CVI-centered accessibility principles](docs/accessibility-principles.md), [Switch Control design](docs/ACCESSIBILITY_DESIGN.md), and [build and device testing](docs/BUILD_AND_DEVICE_TESTING.md).

## 9. Comments and documentation

- Write comments to explain intent, constraints, non-obvious behavior, and reasoning—not to restate the code.
- Use /// documentation comments for declarations that form a reusable API or need explanation for maintainers.
- Start documentation comments with a concise summary. Add parameter, return, throws, precondition, or important notes when they materially help callers.
- Document non-obvious accessibility grouping, focus behavior, timing decisions, audio lifecycle, and concurrency invariants.
- Remove stale, misleading, or commented-out code instead of leaving it as an alternative implementation.
- Do not add TODO comments without enough context to identify the intended follow-up; link to an issue or roadmap task ID when possible.

## 10. Testing and pull request expectations

Before submitting Swift changes:

1. Run swift-format lint --strict --recursive SwitchPlay and report the result.
2. Build with the supported Xcode toolchain on macOS.
3. Run relevant unit and UI tests where they exist.
4. Test on a physical iPad when the change affects device behavior, audio, accessibility focus, or Switch Control.
5. Test one-switch Auto Scanning, two-switch Manual Scanning, and three-switch Manual Scanning when the affected interaction requires it.
6. Review VoiceOver and relevant accessibility behavior.
7. Update documentation, status, roadmap, and CHANGES.md as appropriate.
8. State which tests were not run and why.

A contributor working on Windows can edit Swift and run repository-level text checks, but cannot complete an Xcode build, signing, deployment, or physical-device validation without macOS and the required hardware.

## 11. Exceptions and evolving the standard

If a rule conflicts with a documented platform constraint, compiler limitation, accessibility requirement, or existing architectural decision:

- Explain the exception in the pull request.
- Keep the exception as narrow as possible.
- Document why the standard rule is unsuitable.
- Add or adjust automated rules only when the team agrees on the policy.
- Do not weaken the formatter or lint configuration just to make a failing change pass.

This standard should evolve with the Swift toolchain and project needs. Review external links and formatter configuration when upgrading the Swift/Xcode toolchain. Check official upstream release notes before changing tool versions, record the date/version evidence, and do not raise the deployment target or change Swift language mode without a separate compatibility decision and build evidence.
