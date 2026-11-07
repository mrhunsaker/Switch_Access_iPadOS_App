# Repository consistency and toolchain audit

**Audit date:** 2026-11-07  
**Scope:** Default branch `main`; repository source, project specification, contributor policies, accessibility requirements, all documentation, prompt library, dependency declarations, and GitHub Actions workflows.

This is a point-in-time review, not a guarantee that upstream releases will remain current. Recheck official release sources before future upgrades.

## Outcome

The repository's product requirements are internally consistent after the reconciliation changes recorded on this date. The core contract remains:

- Native SwiftUI iPadOS application.
- Apple's system-wide Switch Control only; no app-specific scanning engine, cursor, switch pairing, or system-settings inspection.
- User-configured switch assignments: Previous Item, Next Item, and Select Item for three-switch Manual Scanning; Next Item and Select Item for two-switch Manual Scanning; Select Item with Auto Scanning for one switch.
- Native accessibility semantics, deliberate scan grouping, and select-then-select interactions rather than essential drag-only workflows.
- CVI is heterogeneous; individualized configuration and participatory evaluation are required. No universal CVI preset or unsupported clinical claims.
- Source committed, linted, built, simulator-tested, physical-device-tested, physical-switch-tested, and participatory-evaluated remain separate evidence levels.

## Findings reconciled

| Finding | Resolution |
| --- | --- |
| Status page contained literal escaped newline text inside a Markdown table. | Corrected the table and updated its evidence. |
| LLM workflow contained a heading with literal escaped newline sequences. | Replaced them with real Markdown line breaks. |
| Unreleased change log repeated section headings. | Consolidate current changes into one Added/Changed/Status structure; retain dated history. |
| Two roadmaps could be mistaken as equally authoritative. | `docs/roadmap.md` is the living task/status plan; `docs/DEVELOPMENT_ROADMAP.md` is the original technical phase guide. |
| Three-switch prompt mapping omitted the scanning style. | Prompt now explicitly says Manual Scanning, matching README and accessibility guides. |
| Project status described Pages deployment as pending despite a successful prior run. | Record run 42402479023 as a successful build/deploy before the current workflow-action upgrade; verify the new run separately. |
| Swift lint workflow used the Xcode-bundled formatter (6.3.0), while the formatter guide did not pin a CI-compatible version. | CI now installs and checks swift-format 604.0.0 before strict lint; the source lint is still failing and remains open. |
| Documentation install guidance said Python 3.10+, but current Material requires Python 3.11+. | Updated contributor and environment guidance to Python 3.11+; CI uses Python 3.12. |
| Toolchain upgrades could be confused with changes to language compatibility or minimum OS. | Keep iPadOS 17 deployment target and Swift 5 language mode unchanged pending a separate compatibility decision and build evidence. |

## Current tool and dependency baseline

Versions below were checked against upstream release information on **2026-11-07**.

| Component | Repository baseline | Notes |
| --- | --- | --- |
| XcodeGen | 2.46.0 current stable | Installed via Homebrew; the repository does not pin XcodeGen in a lockfile. |
| Swift formatter | swift-format 604.0.0 | CI installs the Homebrew formula and asserts this version before lint. |
| GitHub Actions checkout | v7.0.1 | Workflow references major tag `@v7`. |
| GitHub Actions setup-python | v7.0.0 | Workflow references major tag `@v7`. |
| GitHub Pages artifact upload | v5.0.0 | Workflow references major tag `@v5`. |
| GitHub Pages deployment | v5.0.1 | Workflow references major tag `@v5`. |
| MkDocs Material | 9.8.0 | Exact version pinned in `requirements-docs.txt`. |
| Python for docs CI | 3.15.2 | Latest stable Python release on the audit date; meets Material's Python 3.11+ requirement. |
| iPadOS deployment target | 17.0 | Product compatibility baseline; not raised as part of a tooling refresh. |
| Swift language mode | 5.0 | Xcode build setting selecting Swift 5 language mode; it is not a compiler-version pin. |

### Upstream release references

- [XcodeGen releases](https://github.com/yonaskolb/XcodeGen/releases) and [Homebrew formula](https://formulae.brew.sh/formula/xcodegen)
- [swift-format releases](https://github.com/swiftlang/swift-format/releases)
- [actions/checkout releases](https://github.com/actions/checkout/releases)
- [actions/setup-python releases](https://github.com/actions/setup-python/releases)
- [actions/upload-pages-artifact releases](https://github.com/actions/upload-pages-artifact/releases)
- [actions/deploy-pages releases](https://github.com/actions/deploy-pages/releases)
- [MkDocs Material on PyPI](https://pypi.org/project/mkdocs-material/) and [upstream changelog](https://squidfunk.github.io/mkdocs-material/changelog/)
- [Python release versions](https://www.python.org/doc/versions/) and [Python version support status](https://devguide.python.org/versions/)
- [Apple Xcode release notes](https://developer.apple.com/documentation/xcode-release-notes) and [Xcode system requirements](https://developer.apple.com/xcode/system-requirements/)

## Deliberate compatibility decisions

- Do not raise the iPadOS minimum from 17.0 merely because newer SDKs exist. Reassess only when product requirements and supported devices justify it.
- Do not switch `SWIFT_VERSION` from 5.0 to Swift 6 language mode in a documentation/tooling refresh. Swift 6 migration requires a separate concurrency audit, compiler build, and runtime validation.
- Use the latest stable Xcode supported by the available Mac for the first native build. Do not require a beta Xcode release.
- XcodeGen is installed from the current stable Homebrew formula. If a reproducible exact version becomes necessary, add an explicit setup/version check rather than silently relying on a stale number.

## Documentation platform lifecycle

MkDocs Material 9.8.0 is the current pinned release. Upstream has announced end of life on **2027-05-05** and identifies Zensical as its maintained successor. Do not perform an untested migration during this consistency pass. Create and complete a compatibility evaluation before the end-of-life date, including navigation, theme, search, strict-build, and Pages deployment checks.

- [Material for MkDocs end-of-life notice and migration information](https://squidfunk.github.io/mkdocs-material/)

## Outstanding verification and user-owned work

1. **CI-01 remains IMPLEMENTED_UNVERIFIED:** strict lint previously failed on source formatting violations. The new pinned formatter workflow must pass before this task is complete.
2. **DOC-01 is VERIFIED_COMPLETE:** updated strict MkDocs build, artifact upload, and GitHub Pages deployment passed in run 42403559310 with Python 3.15.2, MkDocs Material 9.8.0, and the upgraded Actions.
3. The Swift source has not been compiled with Xcode. A Mac is still required.
4. No physical iPad, physical-switch, VoiceOver, or CVI participatory validation is claimed.
5. The app's iPadOS 17 deployment target and Swift 5 language mode are intentionally retained pending build evidence.

## Audit maintenance rule

Run this audit after material changes to requirements, project configuration, workflows, dependencies, accessibility design, or documentation structure. Update the as-of date and version table only after checking official upstream sources. Preserve historical failures and verification boundaries; do not convert a configured workflow into a passing check without a successful run.
